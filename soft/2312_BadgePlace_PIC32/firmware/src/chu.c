/*******************************************************************************
 *    ________  _________  ____    ____  _____          ________   ______   
 *   |_   __  ||  _   _  ||_   \  /   _||_   _|        |_   __  |.' ____ \  
 *     | |_ \_||_/ | | \_|  |   \/   |    | |     ______ | |_ \_|| (___ \_| 
 *     |  _| _     | |      | |\  /| |    | |   _|______||  _| _  _.____`.  
 *    _| |__/ |   _| |_    _| |_\/_| |_  _| |__/ |      _| |__/ || \____) | 
 *   |________|  |_____|  |_____||_____||________|     |________| \______.' 
 *                                                                      
 *******************************************************************************
 * 
 * File    		: chu.c
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing Chilli UART b1 state machine and commands
 *                Manufacturer library is needed to interface it
 *                https://eccel.co.uk/wp-content/downloads/C-library-for-B1.zip
 *  
 *******************************************************************************
 *
 * Author 		: Miguel Santos
 * Date 		: 25.09.2023
 *
 *******************************************************************************
 *
 * MPLAB X 		: 5.45
 * XC32 		: 2.50
 * Harmony 		: 2.06
 *
 ******************************************************************************/

#include "chu.h"
#include "modules/ccittcrc.h"
#include "modules/TLC5973.h"

/******************************************************************************/

/* Enable or disable debug of specific parts by (un)comment */
#ifndef DEBUG_LED
    #define DEBUG_LED PORTGbits.RG9
#endif
//#define DEBUG_CHU_UART

/******************************************************************************/

/* Define UART and interupts used by Chilli */
#define CHU_USART_BAUD                9600
#define CHU_USART_ID                  USART_ID_2
#define CHU_INT_SOURCE_USART_ERROR    INT_SOURCE_USART_2_ERROR
#define CHU_INT_SOURCE_USART_RECEIVE  INT_SOURCE_USART_2_RECEIVE
#define CHU_INT_SOURCE_USART_TRANSMIT INT_SOURCE_USART_2_TRANSMIT

/******************************************************************************/

/* Declaration of global application data */
CHU_DATA chuData;

/* RFID B1 UART objects */
RFIDB1_InterfaceConfigurationT chuRfid_config;
RFIDB1_InterfaceT chuRfid_interface;
RFIDB1_ObjectT chuRfid_object;

/******************************************************************************/

/**
 * @brief CHU_Initialize
 *
 * Initialize Chilli state machine, counters and FIFOs
 * Setup objects needed for RFIDB1 interface
 *
 * @param  void
 * @return void
 */
void CHU_Initialize ( void )
{
    /* Place the state machine in its initial state. */
    chuData.state = CHU_STATE_IDLE;
    
    /* Initial flags values */
    chuData.transmit = false;
    chuData.receive  = false;
    chuData.waiting  = false;
    
    /* Reception counter waiting the duration of 2/3 bytes by uart */
    CNT_Initialize(&chuData.cntReceive, 3);
    
    /* Initialize UART communication fifos */
    FIFO_Initialize(&chuData.fifoDesc_rx, CHU_FIFO_SIZE,
                        chuData.fifoBuff_rx, 0x00);
    FIFO_Initialize(&chuData.fifoDesc_tx, CHU_FIFO_SIZE,
                        chuData.fifoBuff_tx, 0x00);
    
    /* Config setup for RFIDB1 */
    chuRfid_config.InputBuffer = chuData.rfidBuff_in;
    chuRfid_config.InputBufferSize = CHU_FIFO_SIZE;
    chuRfid_config.OutputBuffer = chuData.rfidBuff_out;
    chuRfid_config.OutputBufferSize = CHU_FIFO_SIZE;
    chuRfid_config.handleResponse = CHU_RFID_Response;
    chuRfid_config.handleRequest = CHU_RFID_Request;
    
    /* Initialise RFIDB1 objects */
    GetRFIDB1Interface(&chuRfid_interface);
    chuRfid_interface.Initialise(&chuRfid_object, &chuRfid_config);
    chuRfid_interface.SetPacketHeaderType(&chuRfid_object, HeaderTypeA);
}

/******************************************************************************/

/**
 * @brief CHU_Tasks
 *
 * Execute Chilli state machine, should be called cyclically
 *
 * @param  void
 * @return void
 */
void CHU_Tasks ( void )
{    
    /* Check the application's current state. */
    switch ( chuData.state )
    {
        /* Application's initial state. */
        case CHU_STATE_IDLE:
        {       
            if(chuData.transmit)
            {
                chuData.state = CHU_STATE_TRANSMIT;
            }
            else if(chuData.receive)
            {
                chuData.state = CHU_STATE_RECEIVE;
            }
            break;
        }
        
        case CHU_STATE_TRANSMIT:
        {
            /* Check if data still available in FIFO */
            if(FIFO_GetReadSpace(&chuData.fifoDesc_tx))
            {
                /* Enable the interrupt if needed */
                if(!SYS_INT_SourceIsEnabled(CHU_INT_SOURCE_USART_TRANSMIT))
                {                
                    SYS_INT_SourceEnable(CHU_INT_SOURCE_USART_TRANSMIT);
                }
            }
            else
            {
                /* Leave state when fifo is empty */
                chuData.transmit = false;
                chuData.state = CHU_STATE_IDLE;
            }
            break;
        }
            
        case CHU_STATE_RECEIVE:
        {
            if(CNT_Check(&chuData.cntReceive))
            {
                chuData.rfidSize = FIFO_GetReadSpace(&chuData.fifoDesc_rx);
                FIFO_GetBuffer(&chuData.fifoDesc_rx, chuData.rfidBuffer);
                if(chuData.rfidWaiting)
                {        
                    chuData.rfidStatus = chuRfid_interface.ParseIncomingData(
                        &chuRfid_object, chuData.rfidBuffer, chuData.rfidSize);
                    
                    chuData.rfidWaiting = false;
                }
                else
                {
                    
                    strcpy(chuData.rfid_uuid, (char*)chuData.rfidBuffer);
                    //chuData.rfid_uuid = (char*)chuData.rfidBuffer;
                    chuData.rfidNewMessage = true;
                }
                
                chuData.receive = false;
                chuData.state = CHU_STATE_IDLE;
            }
            
            break;
        }
        
        case CHU_STATE_TRANSLATE:
        {
            break;
        }
        
        case CHU_STATE_WAIT:
        {
            break;
        }        

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

bool CHU_IsWaiting( void )
{
    return chuData.rfidWaiting;
}

bool CHU_RFID_IsOk( void )
{
    return chuData.rfidOk;
}

bool CHU_RFID_NewMessage( void )
{
    return chuData.rfidNewMessage;
}

void CHU_RFID_GetMessage( char* outMessage )
{
    strcpy(outMessage, &chuData.rfid_uuid[2]);
    chuData.rfidNewMessage = false;
}

/******************************************************************************/

/**
 * @brief CHU_RFID_Response
 *
 * Function used by interface library to get a command received by UART
 * Should not be called by user !
 * 
 * @param RFIDB1_ObjectT* rfid_object Pointer to RFIDB1 object used by Chilli
 * @param uint8_t *data Output buffer of data to be receive by UART
 * @param uint16_t size Size of the buffer
 */
void CHU_RFID_Response( RFIDB1_ObjectT* rfid_object, uint8_t *data, uint16_t size )
{
    if(size == 1)
    {
        switch(data[0])
        {
            case B1ResponseACK:
            {
                chuData.rfidOk = true;
                break;
            }
            default:
            {
                chuData.rfidOk = false;
                break;
            }
        }
    }
    chuData.waiting = false;
}



/******************************************************************************/

/**
 * @brief CHU_RFID_Request
 *
 * Function used by interface library to send a command by UART
 * Should not be called by user !
 * 
 * @param RFIDB1_ObjectT* rfid_object Pointer to RFIDB1 object used by Chilli
 * @param uint8_t *data Input buffer of data to be send by UART
 * @param uint16_t size Size of the buffer
 */
void CHU_RFID_Request( RFIDB1_ObjectT* rfid_object, uint8_t *data, uint16_t size )
{
    /* Local variables declaration */
    uint8_t i_data;
    uint8_t freeSize;
    uint8_t fifoData;
    
    /* Get the space available in fifo */
    freeSize = FIFO_GetWriteSpace(&chuData.fifoDesc_tx);
    
    if(freeSize >= size)
    {
        /* Add buffer to fifo */
        for(i_data = 0; i_data < size; i_data++)
        {
            fifoData = *(data + i_data);
            FIFO_Add(&chuData.fifoDesc_tx, fifoData); 
        }
        
        /* Data transmission enabled */
        chuData.transmit = true;
        
        /* Enable the transmission interrupt */       
        SYS_INT_SourceEnable(CHU_INT_SOURCE_USART_TRANSMIT);
    }
}

/******************************************************************************/

/**
 * @brief CHU_RFID_EnablePolling
 *
 * Send a raw command to enable polling
 * Modifiy function as needed, based on datasheet
 *
 * @param  void
 * @return void
 */
void CHU_RFID_EnablePolling( void )
{
    /* Local variables declaration */
    uint8_t pollingPacket[19];
    
    /* Command : Polling */
    pollingPacket[0]    = 0x22;

    /* Polling period */
    pollingPacket[1]    = 0x01;

    /* Defined tags */
    pollingPacket[2]    = 0x00; // Number
    pollingPacket[3]    = 0x00; // ASYNC mode
    pollingPacket[4]    = 0x00; // IO Config
    pollingPacket[5]    = 0x00; // PWM
    pollingPacket[6]    = 0x00; // PWM duty
    pollingPacket[7]    = 0x00; // PWM period (lsb)
    pollingPacket[8]    = 0x00; // PWM period 
    pollingPacket[9]    = 0x00; // PWM period (msb)
    pollingPacket[10]   = 0x00; // Timeout [100ms]

    /* Undefined tags */
    pollingPacket[11]   = 0x03; // ASYNC mode
    pollingPacket[12]   = 0x00; // IO Config
    pollingPacket[13]   = 0x03; // PWM
    pollingPacket[14]   = 0x00; // PWM Duty
    pollingPacket[15]   = 0x00; // PWM period (lsb)
    pollingPacket[16]   = 0x00; // PWM period 
    pollingPacket[17]   = 0x00; // PWM period (msb)
    pollingPacket[18]   = 0x0A; // Timeout [100ms]
    
    chuData.rfidWaiting = true;
    
    /* Send command through interface */
    chuRfid_interface.SendWriteToRFIDMemoryCommand(&chuRfid_object, 0x0001,
            pollingPacket, 19);
}


/******************************************************************************/

/**
 * @brief _IntHandlerDrvUsartInstance1
 *
 * Interrupt instance to manage UART communication to RFIDB1 Chilli
 *
 */
void __ISR(_UART_2_VECTOR, ipl7AUTO) _IntHandlerDrvUsartInstance1(void)
{    
    /* Local variables declaration */
    S_Fifo *RX_fifoDescriptor;
    S_Fifo *TX_fifoDescriptor;
    uint8_t TX_size;
    uint8_t TX_BufferFull;
    uint8_t dataFifo;
    USART_ERROR usartStatus;

    /* Pointers to fifo descriptors */
    RX_fifoDescriptor = &chuData.fifoDesc_rx;
    TX_fifoDescriptor = &chuData.fifoDesc_tx;
    
    /* DEBUG */
    #ifdef DEBUG_CHU_UART
        DEBUG_LED = true;
    #endif
    
    /* Reading the error interrupt flag */
    if(SYS_INT_SourceStatusGet(CHU_INT_SOURCE_USART_ERROR))
    {
        /* Clear up the error interrupt flag */
        SYS_INT_SourceStatusClear(CHU_INT_SOURCE_USART_ERROR);
    }
     
     /* Reading the receive interrupt flag */
    if(SYS_INT_SourceStatusGet(CHU_INT_SOURCE_USART_RECEIVE))
    {
        /* Checks overrun or parity error */
        usartStatus = PLIB_USART_ErrorsGet(CHU_USART_ID);

        if(usartStatus)
        {
            /* Errors are auto cleaned when read, except overrun */
            if ( usartStatus & USART_ERROR_RECEIVER_OVERRUN )
            {
                PLIB_USART_ReceiverOverrunErrorClear(CHU_USART_ID);
            }
        }
        else
        {
            chuData.receive = true;
            CNT_Reset(&chuData.cntReceive);
            
            while(PLIB_USART_ReceiverDataIsAvailable(CHU_USART_ID))
            {
                dataFifo = PLIB_USART_ReceiverByteReceive(CHU_USART_ID);
                FIFO_Add(RX_fifoDescriptor, dataFifo);
            }

            /* Clear up the interrupt flag when buffer is empty */
            SYS_INT_SourceStatusClear(CHU_INT_SOURCE_USART_RECEIVE);
        }  
    }
    
    /* Reading the transmit interrupt flag */
    if(SYS_INT_SourceStatusGet(CHU_INT_SOURCE_USART_TRANSMIT))
    {
        TX_size = FIFO_GetReadSpace(TX_fifoDescriptor);
        TX_BufferFull = PLIB_USART_TransmitterBufferIsFull(CHU_USART_ID);

        while(TX_size && !TX_BufferFull)
        {
            FIFO_GetData(TX_fifoDescriptor, &dataFifo);
            PLIB_USART_TransmitterByteSend(CHU_USART_ID, dataFifo);
            TX_size = FIFO_GetReadSpace(TX_fifoDescriptor);
            TX_BufferFull = PLIB_USART_TransmitterBufferIsFull(CHU_USART_ID);
        }

        /* Disable the interrupt, to avoid calling ISR continuously*/
        SYS_INT_SourceDisable(CHU_INT_SOURCE_USART_TRANSMIT);

        /* Clear up the interrupt flag */
        SYS_INT_SourceStatusClear(CHU_INT_SOURCE_USART_TRANSMIT);
    }
    
    /* DEBUG */
    #ifdef DEBUG_CHU_UART
        DEBUG_LED = false;
    #endif    
 }

/******************************************************************************/

/* End of File ****************************************************************/
