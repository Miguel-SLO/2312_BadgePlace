#include "esp.h"


#define DEBUG_LED PORTGbits.RG9
//#define DEBUG_ESP_UART
//#define DEBUG_ESP_GET
//#define DEBUG_ESP_SEND

#define COUNT_RECEIVE_MS 20

#define ESP_USART_ID USART_ID_1
#define ESP_INT_SOURCE_USART_ERROR INT_SOURCE_USART_1_ERROR
#define ESP_INT_SOURCE_USART_RECEIVE INT_SOURCE_USART_1_RECEIVE
#define ESP_INT_SOURCE_USART_TRANSMIT INT_SOURCE_USART_1_TRANSMIT

char AT_RES_NOP[]   = "";
char AT_RES_OK[]    = "\r\nOK\r\n";
char AT_RES_ERROR[] = "\r\nERROR\r\n";

char AT_CMD_AT[]        = "AT";
char AT_CMD_RST[]       = "AT+RST";
char AT_CMD_CWMODEIS[]  = "AT+CWMODE=1";
char AT_CMD_CWMODE[]    = "AT+CWMODE?";
char AT_CMD_CWJAP[]     = "AT+CWJAP=\"ES-SLO-2\",\"slo-etml-es\"";

/* Global application's data */
ESP_DATA espData;

/* Initialize */
void ESP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    espData.state = ESP_STATE_INIT;
    
    /* Initial flags values */
    espData.transmit = false;
    espData.receive  = false;
    
    CNT_Initialize(&espData.cntReceive, COUNT_RECEIVE_MS);
    
    /* Initialize FIFO descriptors */
    FIFO_Initialize(&espData.fifoDesc_tx, ESP_FIFO_SIZE, espData.fifoBuff_tx, 0x00);
    FIFO_Initialize(&espData.fifoDesc_rx, ESP_FIFO_SIZE, espData.fifoBuff_rx, 0x00);
}

void ESP_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( espData.state )
    {
        /* Application's initial state. */
        case ESP_STATE_INIT:
        {
            espData.transmit = ESP_SendCommand(AT_CMD_AT);            
            espData.state = ESP_STATE_IDLE;
            break;
        }
        
        /* Application's waiting for next state */
        case ESP_STATE_IDLE:
        {
            /* Something to transmit in FIFO */
            if(espData.transmit)
            {
                espData.state = ESP_STATE_TRANSMIT;
            }
            /* Something to receive in FIFO */
            else if(espData.receive)
            {
                CNT_Reset(&espData.cntReceive);
                espData.state = ESP_STATE_RECEIVE;
            }
            break;
        }
        
        /* Application's transmitting a message */
        case ESP_STATE_TRANSMIT:
        {
            /* Check if data still available in FIFO */
            if(FIFO_GetReadSpace(&espData.fifoDesc_tx))
            {
                /* Enable the interrupt if needed */
                if(!SYS_INT_SourceIsEnabled(ESP_INT_SOURCE_USART_TRANSMIT))
                {                
                    SYS_INT_SourceEnable(ESP_INT_SOURCE_USART_TRANSMIT);
                }
            }
            else
            {
                /* Leave state when fifo is empty */
                espData.transmit = false;
                espData.state = ESP_STATE_IDLE;
            }
            break;
        }
        
        /* Application's received a message */
        case ESP_STATE_RECEIVE:
        {
            /* Waiting to reach reception counter */
            if(CNT_Check(&espData.cntReceive))
            {
                CNT_Reset(&espData.cntReceive);
                espData.state = ESP_STATE_TRANSLATE;
                espData.translate = true;
                espData.receive = false;
            }                       
            break;
        }
        
        case ESP_STATE_TRANSLATE:
        {
            break;
        }
        
        case ESP_STATE_WAIT:
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

bool ESP_SendCommand( char *p_command )
{
    /* Local variables */
    S_Fifo *p_fifoDesc;
    uint8_t commandSize;
    uint8_t i_string;
    bool commandStatus;
    
    /* DEBUG */
    #ifdef DEBUG_ESP_SEND
        DEBUG_LED = true;
    #endif
    
    /* Dont send a command if still transmitting another or waiting */
    if(!espData.transmit && !espData.wait)
    {
        /* Default command status */
        commandStatus = false;

        /* Point to the desired FIFO */
        p_fifoDesc = &espData.fifoDesc_tx;

        /* Get number of characters to send */
        commandSize = strlen(p_command);

        /* Check if enough space in FIFO */
        if(FIFO_GetWriteSpace(p_fifoDesc) >= (commandSize + 2))
        {   
            /* Loop to add command */
            for(i_string = 0; i_string < commandSize; i_string++)
            {
                FIFO_Add(p_fifoDesc,(uint8_t)(p_command[i_string]));
            }

            /* Add CR and LF suffix to FIFO */
            FIFO_Add(p_fifoDesc,(uint8_t)('\r'));
            FIFO_Add(p_fifoDesc,(uint8_t)('\n'));

            /* Command added to FIFO */
            commandStatus = true;
        }
    }
    /* DEBUG */
    #ifdef DEBUG_ESP_SEND
        DEBUG_LED = false;
    #endif
    
    /* Feedback */
    return commandStatus;
}

bool ESP_GetResponse( void )
{
    S_Fifo *p_fifoDesc;
    uint8_t *p_buffer;
    uint8_t i_string;
    uint8_t sizeRead;
    bool responseStatus;
    
    /* DEBUG */
    #ifdef DEBUG_ESP_GET
        DEBUG_LED = true;
    #endif

    /* Default response status */
    responseStatus = false; 
    
    /* Point to the desired FIFO */
    p_fifoDesc = &espData.fifoDesc_rx;
    
    /* Point to storage buffer */
    p_buffer = (uint8_t*)espData.resBuffer;
    
    sizeRead = FIFO_GetReadSpace(p_fifoDesc);
    
    if( sizeRead )
    {
        for(i_string = 0; i_string < sizeRead; i_string++)
        {
            FIFO_Get(&espData.fifoDesc_rx, p_buffer + i_string);
        }

        /* Set flag */
        responseStatus = true;
    }
    
    /* DEBUG */
    #ifdef DEBUG_ESP_RESPONSE
        DEBUG_LED = false;
    #endif
    
    /* Feedback */
    return responseStatus;
}

bool ESP_Translate( S_AT_PACKET *atPacket, char *buffer)
{
    char *p_command;
    char *p_data;
    char *p_ack;
    
    p_ack = strstr(buffer, AT_RES_OK);
    
    if(p_ack != NULL)
    {
        
    }
    
}

void __ISR(_UART_1_VECTOR, ipl7AUTO) _IntHandlerDrvUsartInstance0(void)
{
    S_Fifo *RX_fifoDescriptor;
    S_Fifo *TX_fifoDescriptor;
    uint8_t TX_size;
    uint8_t TX_BufferFull;
    uint8_t dataFifo;
    USART_ERROR usartStatus;

    /* Pointers to fifo descriptors */
    RX_fifoDescriptor = &espData.fifoDesc_rx;
    TX_fifoDescriptor = &espData.fifoDesc_tx;


    /* DEBUG */
    #ifdef DEBUG_ESP_UART
        DEBUG_LED = true;
    #endif

    /* Reading the error interrupt flag */
    if(SYS_INT_SourceStatusGet(ESP_INT_SOURCE_USART_ERROR))
    {
        /* This means an error has occurred */

        /* Clear up the error interrupt flag */
        SYS_INT_SourceStatusClear(ESP_INT_SOURCE_USART_ERROR);
    }

    /* Reading the receive interrupt flag */
    if(SYS_INT_SourceStatusGet(ESP_INT_SOURCE_USART_RECEIVE))
    {
        /* Checks overrun or parity error */
        usartStatus = PLIB_USART_ErrorsGet(ESP_USART_ID);

        if(usartStatus)
        {
            /* Errors are auto cleaned when read, except overrun */
            if ( usartStatus & USART_ERROR_RECEIVER_OVERRUN )
            {
                PLIB_USART_ReceiverOverrunErrorClear(ESP_USART_ID);
            }
        }
        else
        {
            espData.receive = true;
            
            while(PLIB_USART_ReceiverDataIsAvailable(ESP_USART_ID))
            {
                dataFifo = PLIB_USART_ReceiverByteReceive(ESP_USART_ID);
                FIFO_Add(RX_fifoDescriptor, dataFifo);
            }

            /* Clear up the interrupt flag when buffer is empty */
            SYS_INT_SourceStatusClear(ESP_INT_SOURCE_USART_RECEIVE);
        }  
    }

    /* Reading the transmit interrupt flag */
    if(SYS_INT_SourceStatusGet(ESP_INT_SOURCE_USART_TRANSMIT))
    {
        TX_size = FIFO_GetReadSpace(TX_fifoDescriptor);
        TX_BufferFull = PLIB_USART_TransmitterBufferIsFull(ESP_USART_ID);

        while(TX_size && !TX_BufferFull)
        {
            FIFO_Get(TX_fifoDescriptor, &dataFifo);
            PLIB_USART_TransmitterByteSend(ESP_USART_ID, dataFifo);
            TX_size = FIFO_GetReadSpace(TX_fifoDescriptor);
            TX_BufferFull = PLIB_USART_TransmitterBufferIsFull(ESP_USART_ID);
        }

        /* Disable the interrupt, to avoid calling ISR continuously*/
        SYS_INT_SourceDisable(ESP_INT_SOURCE_USART_TRANSMIT);

        /* Clear up the interrupt flag */
        SYS_INT_SourceStatusClear(ESP_INT_SOURCE_USART_TRANSMIT);
    }

    /* DEBUG */
    #ifdef DEBUG_ESP_UART
        DEBUG_LED = false;
    #endif
 }

/*******************************************************************************
 End of File
 */
