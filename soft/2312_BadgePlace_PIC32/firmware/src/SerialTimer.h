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
 * File    		: SerialTimer.h
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Emulate a serial port on a GPIO pin using a timer
 *  
 *******************************************************************************
 *
 * Author 		: Miguel Santos
 * Date 		: 14.09.2023
 *
 *******************************************************************************
 *
 * MPLAB X 		: 5.45
 * XC32 		: 2.50
 * Harmony 		: 2.06
 *
 ******************************************************************************/

/* Guard against multiple inclusion */
#ifndef SERIAL_TIMER_H    
#define SERIAL_TIMER_H

#include <stdint.h>

void SERTIM_Init( void );

void SERTIM_Add(uint8_t *data, uint8_t size);

void SERTIM_Start();

void SERTIM_CallBack( void );

#endif /* SERIAL_TIMER_H */

/* End of File ****************************************************************/