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

/******************************************************************************/

/* Enable or disable debug of specific parts by (un)comment */
#ifndef DEBUG_LED
    #define DEBUG_LED PORTGbits.RG9
#endif
//#define DEBUG_CHU_UART

/******************************************************************************/

/* Define UART and interupts used by Chilli */
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
    
    /* Initialize UART communication fifos */
    FIFO_Initialize(&chuData.fifoDesc_rx, CHU_FIFO_SIZE,
                        chuData.fifoBuff_rx, 0x00);
    FIFO_Initialize(&chuData.fifoDesc_tx, CHU_FIFO_SIZE,
                        chuData.fifoBuff_tx, 0x00);
    
    /* Config setup for RFIDB1 */
    chuRfid_config.InputBuffer = chuData.fifoBuff_tx;
    chuRfid_config.InputBufferSize = CHU_FIFO_SIZE;
    chuRfid_config.OutputBuffer = chuData.fifoBuff_rx;
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
            chuRfid_interface.SendDummyCommand(&chuRfid_object);
            chuData.state = CHU_STATE_TRANSMIT;
            break;
        }
        
        case CHU_STATE_TRANSMIT:
        {
            break;
        }
            
        case CHU_STATE_RECEIVE:
        {               
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
void CHU_RFID_Polling( void )
{
    /* Local variables declaration */
    uint8_t packet[26];
    uint16_t crcHeader;
    uint16_t crcData;
    
    /* Header informations */
    packet[0] = 0x02;
    packet[1] = 0x15;
    packet[2] = 0x00;
    
    /* CRC header */
    crcHeader = GetCCITTCRC(&packet[0], 3);
    packet[3] = crcHeader & 0x00FF;
    packet[4] = (crcHeader & 0xFF00) >> 8;
    
    /* Command : Polling */
    packet[5] = 0x22;

    /* Polling period */
    packet[6] = (uint8_t)(CHU_POLLING_PERIOD_MS / 100);

    /* Defined tags */
    packet[7] = 0x00;   // Number
    packet[8] = 0x00;   // ASYNC mode
    packet[9] = 0x00;   // IO Config
    packet[10] = 0x00;  // PWM
    packet[11] = 0x00;  // PWM duty
    packet[12] = 0x00;  // PWM period (msb)
    packet[13] = 0x00;  // PWM period 
    packet[14] = 0x00;  // PWM period (lsb)
    packet[15] = 0x00;  // Timeout [100ms]

    /* Undefined tags */
    packet[16] = 0x03;  // ASYNC mode
    packet[17] = 0x22;  // IO Config
    packet[18] = 0x00;  // PWM
    packet[19] = 0x32;  // PWM Duty
    packet[20] = 0x00;  // PWM period (msb)
    packet[21] = 0x3E;  // PWM period 
    packet[22] = 0xE8;  // PWM period (lsb)
    packet[23] = 0x32;  // Timeout [100ms]
    
    /* CRC data */
    crcData = GetCCITTCRC(&packet[5], 19);    
    packet[24] = crcData & 0x00FF;
    packet[25] = (crcData & 0xFF00) >> 8;

    /* Send command through interface */
    chuRfid_interface.SendRawDataCommand(&chuRfid_object, packet, 26);      
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
