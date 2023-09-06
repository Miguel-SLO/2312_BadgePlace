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
 * File    		: PIC32_SimpleUART.h
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing communication a simple UART communication
 * 				  using a FIFO 
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
#ifndef PIC32_SIMPLE_UART_H
#define PIC32_SIMPLE_UART_H

#include <stdint.h>
#include "PIC32_Fifo.h"
#include "gestPWM.h"

/*--------------------------------------------------------*/
// Définition des fonctions prototypes
/*--------------------------------------------------------*/

// prototypes des fonctions
void InitFifoComm(void);
int GetMessage(S_pwmSettings *pData);
void SendMessage(S_pwmSettings *pData);

// Descripteur des fifos
extern S_fifo descrFifoRX;
extern S_fifo descrFifoTX;

#endif
