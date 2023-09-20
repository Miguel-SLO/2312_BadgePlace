#include "esp.h"

#define ESP_USART_ID USART_ID_1
#define ESP_INT_SOURCE_USART_ERROR INT_SOURCE_USART_1_ERROR
#define ESP_INT_SOURCE_USART_RECEIVE INT_SOURCE_USART_1_RECEIVE
#define ESP_INT_SOURCE_USART_TRANSMIT INT_SOURCE_USART_1_TRANSMIT

ESP_DATA espData;

void ESP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    espData.state       = ESP_STATE_INIT;
    
    /* Initial flags values */
    espData.transmit    = false;
    espData.receive     = false;
    
    /* Initialize FIFO descriptors */
    FIFO_Initialize(&espData.fifoDescr_tx, ESP_FIFO_SIZE, espData.fifo_tx, 0x00);
    FIFO_Initialize(&espData.fifoDescr_rx, ESP_FIFO_SIZE, espData.fifo_rx, 0x00);
}

/******************************************************************************
  Function:
    void ESP_Tasks ( void )

  Remarks:
    See prototype in esp.h.
 */

void ESP_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( espData.state )
    {
        /* Application's initial state. */
        case ESP_STATE_INIT:
        {
            //ESP_SendCommand("AT");
            
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
                espData.state = ESP_STATE_RECEIVE;
            }
            break;
        }
        
        case ESP_STATE_TRANSMIT:
        {
            /* Check if data available in FIFO */
            if(FIFO_GetReadSpace(&espData.fifoDescr_tx))
            {
                /* Enable the interrupt if needed */
                if(PLIB_INT_SourceIsEnabled(INT_ID_0 , ESP_INT_SOURCE_USART_TRANSMIT) == false)
                {                
                    SYS_INT_SourceEnable(ESP_INT_SOURCE_USART_TRANSMIT);
                }
            }
            else
            {
                /* Leave when fifo is empty */
                espData.transmit = false;
                espData.state = ESP_STATE_IDLE;
            }
            break;
        }
        
        case ESP_STATE_RECEIVE:
        {
            espData.state = ESP_STATE_IDLE;
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

void ESP_SendCommand(const char* command)
{
    S_Fifo *fifoDescr;
    uint8_t commandSize;
    uint8_t iStr;
    
    fifoDescr = &espData.fifoDescr_tx;
    
    commandSize = strlen(command);
    
    if(FIFO_GetWriteSpace(fifoDescr) >= commandSize)
    {
        for(iStr = 0; iStr < commandSize; iStr++)
        {
            FIFO_Add(fifoDescr,(uint8_t)(command[iStr]));
        }
        
        espData.transmit = true;
    }
}

void __ISR(_UART_1_VECTOR, ipl6AUTO) _IntHandlerDrvUsartInstance0(void)
{
    S_Fifo *RX_fifoDescriptor;
    S_Fifo *TX_fifoDescriptor;
    uint8_t TX_size;
    uint8_t TX_BufferFull;
    uint8_t dataFifo;
    USART_ERROR usartStatus;

    /* Pointers to fifo descriptors */
    RX_fifoDescriptor = &espData.fifoDescr_rx;
    TX_fifoDescriptor = &espData.fifoDescr_tx;


    /* DEBUG */
    PORTGbits.RG9 = 1;

    /* Reading the error interrupt flag */
    if(SYS_INT_SourceStatusGet(ESP_INT_SOURCE_USART_ERROR))
    {
        /* This means an error has occurred */

        /* Clear up the error interrupt flag */
        SYS_INT_SourceStatusClear(ESP_INT_SOURCE_USART_ERROR);
    }

    /* Reading the receive interrupt flag */
    if(SYS_INT_SourceStatusGet(ESP_INT_SOURCE_USART_RECEIVE) && PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_RECEIVE) )
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
    if(SYS_INT_SourceStatusGet(ESP_INT_SOURCE_USART_TRANSMIT) && PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT))
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
        PLIB_INT_SourceDisable (INT_ID_0 , INT_SOURCE_USART_1_TRANSMIT);
        //SYS_INT_SourceDisable(ESP_INT_SOURCE_USART_TRANSMIT);

        /* Clear up the interrupt flag */
        SYS_INT_SourceStatusClear(ESP_INT_SOURCE_USART_TRANSMIT);
    }

    /* DEBUG */
    PORTGbits.RG9 = 0;
 }

/*******************************************************************************
 End of File
 */
