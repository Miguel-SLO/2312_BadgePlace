// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "chu.h"
#include "modules/ccittcrc.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

CHU_DATA chuData;

/* Fifo descriptors */
S_Fifo fifoDescr_rx;
S_Fifo fifoDescr_tx;

/* Fifo data buffers */
uint8_t fifo_rx[CHU_FIFO_SIZE];
uint8_t fifo_tx[CHU_FIFO_SIZE];

/* RFID B1 UART objects */
RFIDB1_InterfaceConfigurationT chuRfid_config;
RFIDB1_InterfaceT chuRfid_interface;
RFIDB1_ObjectT chuRfid_object;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void CHU_Initialize ( void )

  Remarks:
    See prototype in chu.h.
 */

void CHU_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    chuData.state = CHU_STATE_INIT;

    
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
    
    /* Initialize UART communication fifos */
    FIFO_Initialize(&fifoDescr_rx, CHU_FIFO_SIZE, fifo_rx, 0x00);
    FIFO_Initialize(&fifoDescr_tx, CHU_FIFO_SIZE, fifo_tx, 0x00);
    
    chuRfid_config.InputBuffer = fifo_tx;
    chuRfid_config.InputBufferSize = CHU_FIFO_SIZE;
    chuRfid_config.OutputBuffer = fifo_rx;
    chuRfid_config.OutputBufferSize = CHU_FIFO_SIZE;
    chuRfid_config.handleResponse = CHU_RFID_Response;
    chuRfid_config.handleRequest = CHU_RFID_Request;

    GetRFIDB1Interface(&chuRfid_interface);
    chuRfid_interface.Initialise(&chuRfid_object, &chuRfid_config);
    chuRfid_interface.SetPacketHeaderType(&chuRfid_object, HeaderTypeA);
}


/******************************************************************************
  Function:
    void CHU_Tasks ( void )

  Remarks:
    See prototype in chu.h.
 */
uint8_t counter = 0;

void CHU_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( chuData.state )
    {
        /* Application's initial state. */
        case CHU_STATE_INIT:
        {       
            chuData.state = CHU_STATE_IDLE;
            break;
        }
        
        case CHU_STATE_IDLE:
        {
            break;
        }
            
        case CHU_STATE_SERVICE_TASKS:
        {               
            chuRfid_interface.SendDummyCommand(&chuRfid_object);
            chuData.state = CHU_STATE_IDLE;
            
            break;
        }

        /* TODO: implement your application state machine.*/
        

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

void CHU_RFID_Response( RFIDB1_ObjectT* rfid_object, uint8_t *data, uint16_t size )
{
    
}

void CHU_RFID_Request( RFIDB1_ObjectT* rfid_object, uint8_t *data, uint16_t size )
{
    uint8_t i_data = 0;
    uint8_t freeSize;
    uint8_t tempData = 0;
    
    freeSize = FIFO_GetWriteSpace(&fifoDescr_tx);
    
    if(freeSize >= size)
    {
        for(i_data = 0; i_data < size; i_data++)
        {
            tempData = *(data + i_data);
            FIFO_Add(&fifoDescr_tx, tempData); 
        }
        PLIB_INT_SourceEnable(INT_ID_0, INT_SOURCE_USART_2_TRANSMIT);
    }
}

void CHU_RFID_EnablePolling( void )
{
    uint8_t packet[26];
    uint16_t crcHeader;
    uint16_t crcData;
    
    packet[0] = 0x02; // Header
    packet[1] = 0x15;
    packet[2] = 0x00;
    
    crcHeader = GetCCITTCRC(&packet[0], 3);
    
    packet[3] = crcHeader & 0x00FF;
    packet[4] = (crcHeader & 0xFF00) >> 8;
    
    packet[5] = 0x22; // Command : Polling

    /* Polling period */
    packet[6] = (uint8_t)(CHU_POLLING_PERIOD_MS / 100);

    /* Defined tags */
    packet[7] = 0x00; // Number
    packet[8] = 0x00; // ASYNC mode
    packet[9] = 0x00; // IO Config
    packet[10] = 0x00; // PWM
    packet[11] = 0x00; // PWM duty
    packet[12] = 0x00; // PWM period (msb)
    packet[13] = 0x00; // PWM period 
    packet[14] = 0x00; // PWM period (lsb)
    packet[15] = 0x00; // Timeout [100ms]

    /* Undefined tags */
    packet[16] = 0x03; // ASYNC mode
    packet[17] = 0x22; // IO Config
    packet[18] = 0x00; // PWM
    packet[19] = 0x32; // PWM Duty
    packet[20] = 0x00; // PWM period (msb)
    packet[21] = 0x3E; // PWM period 
    packet[22] = 0xE8; // PWM period (lsb)
    packet[23] = 0x32; // Timeout [100ms]
    
    crcData = GetCCITTCRC(&packet[5], 19);
    
    packet[24] = crcData & 0x00FF;
    packet[25] = (crcData & 0xFF00) >> 8;

    chuRfid_interface.SendRawDataCommand(&chuRfid_object, packet, 26);
            
}

void __ISR(_UART_2_VECTOR, ipl7AUTO) _IntHandlerDrvUsartInstance1(void)
{
     uint8_t TXsize;
     uint8_t charFifo;
     bool TxBuffFull;
     
     USART_ERROR UsartStatus;
     
     PORTGbits.RG9 = 1;
     
     
    // Is this an Error interrupt ?
    if ( PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_2_ERROR) &&
                 PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_2_ERROR) ) {
        /* Clear pending interrupt */
        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_2_ERROR);
        // Traitement de l'erreur à la réception.
    }

    // Is this an RX interrupt ?
    if ( PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_2_RECEIVE) &&
                 PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_2_RECEIVE) ) {

        // Oui Test si erreur parité ou overrun
        UsartStatus = PLIB_USART_ErrorsGet(USART_ID_2);

        if ( (UsartStatus & (USART_ERROR_PARITY |
                             USART_ERROR_FRAMING | USART_ERROR_RECEIVER_OVERRUN)) == 0)
        {
            while(PLIB_USART_ReceiverDataIsAvailable(USART_ID_2))
            {
               charFifo = PLIB_USART_ReceiverByteReceive(USART_ID_2);
               FIFO_Add(&fifoDescr_rx, charFifo);
            }
                         
            // buffer is empty, clear interrupt flag
            PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_2_RECEIVE);
        }
        else
        {
            // Suppression des erreurs
            // La lecture des erreurs les efface sauf pour overrun
            if ( (UsartStatus & USART_ERROR_RECEIVER_OVERRUN) == USART_ERROR_RECEIVER_OVERRUN)
            {
                   PLIB_USART_ReceiverOverrunErrorClear(USART_ID_2);
            }
        }  
    } // end if RX
    
    // Is this an TX interrupt ?
    if ( PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_2_TRANSMIT) &&
                 PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_2_TRANSMIT) ) {

        // Traitement TX à faire ICI
        // Envoi des caractères depuis le fifo SW -> buffer HW
        
        TXsize = FIFO_GetReadSpace(&fifoDescr_tx);
        
        TxBuffFull = PLIB_USART_TransmitterBufferIsFull(USART_ID_2);
        
        if((TXsize > 0) && TxBuffFull == false)
        {
            do{
                FIFO_Get(&fifoDescr_tx, &charFifo);
                PLIB_USART_TransmitterByteSend(USART_ID_2, charFifo);
                TXsize = FIFO_GetReadSpace(&fifoDescr_tx);
                TxBuffFull = PLIB_USART_TransmitterBufferIsFull(USART_ID_2);
            }while((TXsize > 0) && TxBuffFull == false);
        }
		
        if(TXsize == 0)
        {
            // disable TX interrupt (pour éviter une interrupt. inutile si plus rien à transmettre)
            PLIB_INT_SourceDisable(INT_ID_0, INT_SOURCE_USART_2_TRANSMIT);
            // Clear the TX interrupt Flag (Seulement apres TX) 
            PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_2_TRANSMIT);
        }
        
        
    }
     
     PORTGbits.RG9 = 0;
 }

/*******************************************************************************
 End of File
 */
