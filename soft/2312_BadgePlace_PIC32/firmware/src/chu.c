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
#include "modules/fifo.h"
//#include "modules/ccittcrc.h"
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

/* Application's buffers size */
#define CHU_FIFO_SIZE 0xFF

#define RFIDB1_BUFF_SIZE CHU_FIFO_SIZE

#define RFIDB1_UID_MAX_SIZE 7

/******************************************************************************/

/* Chilli UART State machine*/
typedef enum
{            
    /* Waiting for a command */
    CHU_STATE_IDLE,            
    /* Transmitting a command */
    CHU_STATE_TRANSMIT,            
    /* Receiving a command */
    CHU_STATE_RECEIVE,            

} CHU_STATES;

/******************************************************************************/

/* RFIDB1 UART objects */
RFIDB1_InterfaceConfigurationT  RFIDB1_config;
RFIDB1_InterfaceT               RFIDB1_interface;
RFIDB1_ObjectT                  RFIDB1_object;
RFIDB1_StatusT                  RFIDB1_status;
B1ResponseT                     RFIDB1_response;
uint8_t                         RFIDB1_async;

/* RFIDB1 buffers */
uint8_t RFIDB1_TX_buffer[RFIDB1_BUFF_SIZE];
uint8_t RFIDB1_RX_buffer[RFIDB1_BUFF_SIZE];

uint8_t RFIDB1_GL_buffer[RFIDB1_BUFF_SIZE];
uint8_t RFIDB1_GL_size;

uint8_t RFIDB1_UID_data[RFIDB1_UID_MAX_SIZE];
uint8_t RFIDB1_UID_size;

/******************************************************************************/

/* Application's current state */
CHU_STATES CHU_state;

/******************************************************************************/

/* Application's flags */
bool CHU_transmit;
bool CHU_receive;

bool CHU_newRES;
bool CHU_newACK;
bool CHU_newUID;

/******************************************************************************/

/* Application's counters */
S_Counter CNT_receive;

/******************************************************************************/

/* Application's FIFOs */
S_Fifo CHU_FIFO_TX_descriptor;
S_Fifo CHU_FIFO_RX_descriptor;

/* Application's FIFOs buffers */
uint8_t CHU_FIFO_TX_buffer[CHU_FIFO_SIZE];
uint8_t CHU_FIFO_RX_buffer[CHU_FIFO_SIZE];

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
    CHU_state = CHU_STATE_IDLE;
    
    /* Initial flags values */
    CHU_transmit = false;
    CHU_receive  = false;
    
    /* Reception counter waiting the duration of 2/3 bytes by uart */
    CNT_Initialize(&CNT_receive, 3);
    
    /* Initialize UART communication fifos */
    FIFO_Initialize(&CHU_FIFO_RX_descriptor, CHU_FIFO_SIZE,
                        CHU_FIFO_RX_buffer, 0x00);
    FIFO_Initialize(&CHU_FIFO_TX_descriptor, CHU_FIFO_SIZE,
                        CHU_FIFO_TX_buffer, 0x00);
    
    /* Config setup for RFIDB1 */
    RFIDB1_config.InputBuffer       = RFIDB1_TX_buffer;
    RFIDB1_config.InputBufferSize   = RFIDB1_BUFF_SIZE;
    
    RFIDB1_config.OutputBuffer      = RFIDB1_RX_buffer;
    RFIDB1_config.OutputBufferSize  = RFIDB1_BUFF_SIZE;
    
    RFIDB1_config.handleResponse    = CHU_RFID_Response;
    RFIDB1_config.handleRequest     = CHU_RFID_Request;
    
    /* Initialise RFIDB1 objects */
    GetRFIDB1Interface(&RFIDB1_interface);
    RFIDB1_interface.Initialise(&RFIDB1_object, &RFIDB1_config);
    RFIDB1_interface.SetPacketHeaderType(&RFIDB1_object, HeaderTypeA);
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
    switch ( CHU_state )
    {
        /* ------------------------------------------------------------------ */
        /* Waiting for event on flags                                         */
        /* ------------------------------------------------------------------ */
        case CHU_STATE_IDLE:
        {       
            if(CHU_transmit)
            {
                CHU_state = CHU_STATE_TRANSMIT;
            }
            else if(CHU_receive)
            {
                CHU_state = CHU_STATE_RECEIVE;
            }
            break;
        }
        
        /* ------------------------------------------------------------------ */
        /* Transmiting command by UART                                        */
        /* ------------------------------------------------------------------ */
        case CHU_STATE_TRANSMIT:
        {
            /* Check if data still available in FIFO */
            if(FIFO_GetReadSpace(&CHU_FIFO_TX_descriptor))
            {
                /* Enable the interrupt if needed */
                if(!SYS_INT_SourceIsEnabled(CHU_INT_SOURCE_USART_TRANSMIT))
                {                
                    SYS_INT_SourceEnable(CHU_INT_SOURCE_USART_TRANSMIT);
                }
            }
            else
            {
                /* Leave state when FIFO is empty */
                CHU_transmit = false;
                CHU_state = CHU_STATE_IDLE;
            }
            break;
        }
        
        /* ------------------------------------------------------------------ */
        /* Receiving a command by UART                                        */
        /* ------------------------------------------------------------------ */
        case CHU_STATE_RECEIVE:
        {
            /* Waiting for FIFO to be filled */
            if(CNT_Check(&CNT_receive))
            {
                RFIDB1_GL_size = FIFO_GetReadSpace(&CHU_FIFO_RX_descriptor);
                
                FIFO_GetBuffer(&CHU_FIFO_RX_descriptor, RFIDB1_GL_buffer);
                
                RFIDB1_status = RFIDB1_interface.ParseIncomingData(
                            &RFIDB1_object, RFIDB1_GL_buffer, RFIDB1_GL_size);
                
                CHU_newRES = true;
                
                CHU_receive = false;
                
                CHU_state = CHU_STATE_IDLE;
            }
            break;
        }
        
        /* ------------------------------------------------------------------ */
        /* Errors handle                                                      */
        /* ------------------------------------------------------------------ */
        default:
        {
            break;
        }
    }
}

bool CHU_NewRES( void )
{
    return CHU_newRES;
}

bool CHU_NewACK( void )
{
    return CHU_newACK;
}

bool CHU_NewUID( void )
{
    return CHU_newUID;
}

void CHU_ResetFlags( void )
{
    CHU_newRES = false;
    CHU_newACK = false;
    CHU_newUID = false;
}

void CHU_GetUID(uint8_t* uid)
{
    memcpy(uid, RFIDB1_UID_data, RFIDB1_UID_size);
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
    freeSize = FIFO_GetWriteSpace(&CHU_FIFO_TX_descriptor);
    
    if(freeSize >= size)
    {
        /* Add buffer to fifo */
        for(i_data = 0; i_data < size; i_data++)
        {
            fifoData = *(data + i_data);
            FIFO_Add(&CHU_FIFO_TX_descriptor, fifoData); 
        }
        
        /* Data transmission enabled */
        CHU_transmit = true;
        
        /* Enable the transmission interrupt */       
        SYS_INT_SourceEnable(CHU_INT_SOURCE_USART_TRANSMIT);
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
    /* Asynchronous Packet Parameter at index 0x00 */
    RFIDB1_response = data[0];
    
    switch(RFIDB1_response)
    {
        case B1ResponseACK:
        {
            CHU_newACK = true;
            break;
        }
        case B1ResponseAsyncPacket:
        {
            RFIDB1_async = data[1];
            switch(RFIDB1_async)
            {
                case B1AsyncPacketParamBit_RFIDCommand:
                {
                    break;
                }
                case B1AsyncPacketParamBit_Polling:
                {
                    RFIDB1_UID_size = data[2];
                    memcpy(RFIDB1_UID_data, &data[3], RFIDB1_UID_size);
                    CHU_newUID = true;
                    break;
                }
                case B1AsyncPacketParamBit_IO0Edge:
                case B1AsyncPacketParamBit_IO1Edge:
                case B1AsyncPacketParamBit_IO2Edge:
                case B1AsyncPacketParamBit_IO3Edge:
                case B1AsyncPacketParamBit_Comparator:
                default:
                {
                    break;
                }
            }
            break;
        }
        case B1ResponseInvalidCommand:
        case B1ResponseInvalidParameter:
        case B1ResponseProtocolError:
        case B1ResponseMemoryError:
        case B1ResponseSystemError:
        case B1ResponseModuleTimeout:
        case B1ResponseOverflow:        
        case B1ResponseBusy:
        case B1ResponseSystemStart:
        case B1ResponseInvalidPacket:
        default:
        {
            break;
        }
    }
}

/******************************************************************************/

/**
 * @brief CHU_RFID_EnablePolling
 *
 * Send a command to enable polling
 * Modifiy function as needed, based on datasheet
 *
 * @param  void
 * @return void
 */
void CHU_EnablePolling( void )
{
    /* Local variables declaration */
    uint8_t pollingPacket[19];
    
    /* Command : Polling */
    pollingPacket[0]    = 0x22;

    /* Polling period x[100ms] */
    pollingPacket[1]    = 0x05;

    /* Defined tags */
    pollingPacket[2]    = 0x00; // Number
    pollingPacket[3]    = 0x00; // ASYNC mode
    pollingPacket[4]    = 0x00; // IO Config
    pollingPacket[5]    = 0x00; // PWM
    pollingPacket[6]    = 0x00; // PWM duty
    pollingPacket[7]    = 0x00; // PWM period (lsb)
    pollingPacket[8]    = 0x00; // PWM period 
    pollingPacket[9]    = 0x00; // PWM period (msb)
    pollingPacket[10]   = 0x00; // Timeout x[100ms]

    /* Undefined tags */
    pollingPacket[11]   = 0x01; // ASYNC mode
    pollingPacket[12]   = 0x00; // IO Config
    pollingPacket[13]   = 0x03; // PWM
    pollingPacket[14]   = 0x00; // PWM Duty
    pollingPacket[15]   = 0x00; // PWM period (lsb)
    pollingPacket[16]   = 0x00; // PWM period 
    pollingPacket[17]   = 0x00; // PWM period (msb)
    pollingPacket[18]   = 0x14; // Timeout x[100ms]
    
    /* Send command through interface */
    RFIDB1_status = RFIDB1_interface.SendWriteToRFIDMemoryCommand(
                    &RFIDB1_object, B1RegisterCommand, pollingPacket, 19);
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
    RX_fifoDescriptor = &CHU_FIFO_RX_descriptor;
    TX_fifoDescriptor = &CHU_FIFO_TX_descriptor;
    
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
            CHU_receive = true;
            CNT_Reset(&CNT_receive);
            
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
