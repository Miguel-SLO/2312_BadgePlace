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
 * File    		: PIC32_SimpleUART.c
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing a simple UART communication,
 *  			  without flux control, using a FIFO 
 *  
 *******************************************************************************
 *
 * Author 		: Miguel Santos
 * Date 		: 06.09.2023
 *
 *******************************************************************************
 *
 * MPLAB X 		: 5.45
 * XC32 		: 2.50
 * Harmony 		: 2.06
 *
 ******************************************************************************/

#include "PIC32_SimpleUART.h"

#include <xc.h>
#include <sys/attribs.h>
#include "system_definitions.h"
// Ajout CHR
#include <GenericTypeDefs.h>
#include "app.h"
#include "GesFifoTh32.h"
#include "Mc32gest_RS232.h"
#include "gestPWM.h"
#include "Mc32CalCrc16.h"




typedef union {
        uint16_t val;
        struct {uint8_t lsb;
                uint8_t msb;} shl;
} U_manip16;

// Definition pour les messages
#define MESS_SIZE  5
// avec int8_t besoin -86 au lieu de 0xAA
#define STX_code  (-86)

// Structure décrivant le message
typedef struct {
    int8_t Start;
    int8_t  Speed;
    int8_t  Angle;
    int8_t MsbCrc;
    int8_t LsbCrc;
} StruMess;


// Struct pour émission des messages
StruMess TxMess;
// Struct pour réception des messages
StruMess RxMess;

// Declaration des FIFO pour réception et émission
#define FIFO_RX_SIZE ( (4*MESS_SIZE) + 1)  // 4 messages
#define FIFO_TX_SIZE ( (4*MESS_SIZE) + 1)  // 4 messages

int8_t fifoRX[FIFO_RX_SIZE];
// Declaration du descripteur du FIFO de réception
S_fifo descrFifoRX;


int8_t fifoTX[FIFO_TX_SIZE];
// Declaration du descripteur du FIFO d'émission
S_fifo descrFifoTX;


// Initialisation de la communication sérielle
void InitFifoComm(void)
{    
    // Initialisation du fifo de réception
    InitFifo ( &descrFifoRX, FIFO_RX_SIZE, fifoRX, 0 );
    // Initialisation du fifo d'émission
    InitFifo ( &descrFifoTX, FIFO_TX_SIZE, fifoTX, 0 );
    
    // Init RTS 
    RS232_RTS = 1;   // interdit émission par l'autre
   
} // InitComm

// Valeur de retour 0  = pas de message reçu donc local (data non modifié)
// Valeur de retour 1  = message reçu donc en remote (data mis à jour)
int GetMessage(S_pwmSettings *pData)
{
    int commStatus = 0;
    //uint8_t fifoPos = 0;
    uint8_t usedSize = 0;
    U_manip16 RxCRC;
    
    
    usedSize = GetReadSize(&descrFifoRX);
    
    // Traite uniquement si message à recevoir
    if(usedSize >= MESS_SIZE){

        GetCharFromFifo(&descrFifoRX, &RxMess.Start);

        if(RxMess.Start == STX_code)
        {
            
            GetCharFromFifo(&descrFifoRX, &RxMess.Speed);
            GetCharFromFifo(&descrFifoRX, &RxMess.Angle);
            GetCharFromFifo(&descrFifoRX, &RxMess.LsbCrc);
            GetCharFromFifo(&descrFifoRX, &RxMess.MsbCrc);
            
            
            // Calcul du CRC
            RxCRC.val = 0xFFFF;
            RxCRC.val = updateCRC16(RxCRC.val, RxMess.Start);
            RxCRC.val = updateCRC16(RxCRC.val, RxMess.Speed);
            RxCRC.val = updateCRC16(RxCRC.val, RxMess.Angle);
            RxCRC.val = updateCRC16(RxCRC.val, RxMess.LsbCrc);
            RxCRC.val = updateCRC16(RxCRC.val, RxMess.MsbCrc);

            // Comparaison de CRC obtenu et calcule
            if(RxCRC.val == 0)
            {
                // Communication reussie
                commStatus = true;

                pData->SpeedSetting = RxMess.Speed;
                pData->absSpeed = abs(RxMess.Speed);
                pData->AngleSetting = RxMess.Angle;            
            }
            else
            {
                // Erreur de communication
                commStatus = false;
                BSP_LEDToggle(BSP_LED_6);
            }
            
        }
        else
        {
            commStatus = false;
        }

    }
    
    // Gestion controle de flux de la réception
    if(GetWriteSpace (&descrFifoRX) >= (2*MESS_SIZE)) {
        // autorise émission par l'autre
        RS232_RTS = 0;
    }
    return commStatus;
} // GetMessage


// Fonction d'envoi des messages, appel cyclique
void SendMessage(S_pwmSettings *pData)
{
    int8_t freeSize;
    U_manip16 TxCRC;
    
    // Test si place pour écrire 1 message
    freeSize = GetWriteSpace(&descrFifoTX);
    
    if (freeSize >= MESS_SIZE)
    {
        // Formatage message et remplissage fifo émission
        TxMess.Start = 0XAA;
        TxMess.Speed = pData->SpeedSetting;
        TxMess.Angle = pData->AngleSetting;
        
        // Initilisation valeur CRC
        TxCRC.val = 0xFFFF;
        
        // Calcul du CRC16
        TxCRC.val = updateCRC16(TxCRC.val, TxMess.Start);
        TxCRC.val = updateCRC16(TxCRC.val, TxMess.Speed);
        TxCRC.val = updateCRC16(TxCRC.val, TxMess.Angle);
        
        // Dépose le message dans le fifo
        PutCharInFifo(&descrFifoTX, TxMess.Start);
        PutCharInFifo(&descrFifoTX, TxMess.Speed);
        PutCharInFifo(&descrFifoTX, TxMess.Angle);
              
        // Décomposition du CRC16 en MSB & LSB
        PutCharInFifo(&descrFifoTX, TxCRC.shl.msb);
        PutCharInFifo(&descrFifoTX, TxCRC.shl.lsb);
    }
    
    // Gestion du controle de flux
    // si on a un caractère à envoyer et que CTS = 0
    freeSize = GetReadSize(&descrFifoTX);
    if ((RS232_CTS == 0) && (freeSize > 0))
    {
        // Autorise int émission    
        PLIB_INT_SourceEnable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);                
    }
}


// Interruption USART1
// !!!!!!!!
// Attention ne pas oublier de supprimer la réponse générée dans system_interrupt
// !!!!!!!!
  void __ISR(_UART_1_VECTOR, ipl5AUTO) _IntHandlerDrvUsartInstance0(void)
{
    USART_ERROR UsartStatus;    
    int8_t i_cts;
    uint8_t TXsize,freeSize;
    BOOL TxBuffFull;
    int8_t c;

    // Marque début interruption avec Led3
    LED3_W = 1;
    
    // Is this an Error interrupt ?
    if ( PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_ERROR) &&
                 PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_ERROR) ) {
        /* Clear pending interrupt */
        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_ERROR);
        // Traitement de l'erreur à la réception.
    }
   
    // Is this an RX interrupt ?
    if ( PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_RECEIVE) &&
                 PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_RECEIVE) ) {

        // Oui Test si erreur parité ou overrun
        UsartStatus = PLIB_USART_ErrorsGet(USART_ID_1);

        if ( (UsartStatus & (USART_ERROR_PARITY |
                             USART_ERROR_FRAMING | USART_ERROR_RECEIVER_OVERRUN)) == 0) {

            
            // Lecture des caractères depuis le buffer HW -> fifo SW
			// pour savoir s'il y a une data dans le buffer HW RX 
            while (PLIB_USART_ReceiverDataIsAvailable(USART_ID_1))
            {
                // Traitement RX à faire ICI
                // Lecture des caractères depuis le buffer HW -> fifo SW
                c = PLIB_USART_ReceiverByteReceive(USART_ID_1);
                PutCharInFifo ( &descrFifoRX, c);
            }
            
            LED4_W = !LED4_R; // Toggle Led4
            // buffer is empty, clear interrupt flag
            PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_RECEIVE);
        } else {
            // Suppression des erreurs
            // La lecture des erreurs les efface sauf pour overrun
            if ( (UsartStatus & USART_ERROR_RECEIVER_OVERRUN) == USART_ERROR_RECEIVER_OVERRUN) {
                   PLIB_USART_ReceiverOverrunErrorClear(USART_ID_1);
            }
        }

        
        // Traitement controle de flux reception à faire ICI
        // Gerer sortie RS232_RTS en fonction de place dispo dans fifo reception
        freeSize = GetWriteSpace ( &descrFifoRX);
            if (freeSize <= 6) // a cause d'un int pour 6 char
            {
            // Demande de ne plus émettre
                RS232_RTS = 1;              
            }

        
    } // end if RX

    
    // Is this an TX interrupt ?
    if ( PLIB_INT_SourceFlagGet(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT) &&
                 PLIB_INT_SourceIsEnabled(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT) ) {

        

            
        // Avant d'émettre, on vérifie 3 conditions :
        //  Si CTS = 0 autorisation d'émettre (entrée RS232_CTS)
        //  S'il y a un caratères à émettre dans le fifo
        //  S'il y a de la place dans le buffer d'émission
       i_cts = RS232_CTS;
       TXsize = GetReadSize (&descrFifoTX);
       TxBuffFull = PLIB_USART_TransmitterBufferIsFull(USART_ID_1);
       
       if ( (i_cts == 0) && ( TXsize > 0 ) && TxBuffFull==false )
       {
           do{
                // Traitement TX à faire ICI
                // Envoi des caractères depuis le fifo SW -> buffer HW
                GetCharFromFifo(&descrFifoTX, &c);
                PLIB_USART_TransmitterByteSend(USART_ID_1, c);
                LED5_W = !LED5_R; // Toggle Led5
                i_cts = RS232_CTS;
                TXsize = GetReadSize (&descrFifoTX);
                TxBuffFull = PLIB_USART_TransmitterBufferIsFull(USART_ID_1);
            } while ( (i_cts == 0) && ( TXsize > 0 ) && TxBuffFull==false );
                
		
        // disable TX interrupt (pour éviter une interrupt. inutile si plus rien à transmettre)
        PLIB_INT_SourceDisable(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
       }
        // Clear the TX interrupt Flag (Seulement apres TX) 
        PLIB_INT_SourceFlagClear(INT_ID_0, INT_SOURCE_USART_1_TRANSMIT);
    }
    // Marque fin interruption avec Led3
    LED3_W = 0;
 }




