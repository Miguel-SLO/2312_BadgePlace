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
 * File    		: chu.h
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

#ifndef _CHU_H
#define _CHU_H

/******************************************************************************/

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "system_config.h"
#include "system_definitions.h"
#include "modules/RFIDB1ClientInterface.h"
#include "modules/fifo.h"
#include "modules/counter.h"

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
void CHU_Initialize ( void );

/******************************************************************************/

/**
 * @brief CHU_Tasks
 *
 * Execute Chilli state machine, should be called cyclically
 *
 * @param  void
 * @return void
 */
void CHU_Tasks( void );

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
void CHU_RFID_Response( RFIDB1_ObjectT* rfid_object, uint8_t *data, uint16_t size );

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
void CHU_RFID_Request( RFIDB1_ObjectT* rfid_object, uint8_t *data, uint16_t size );

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
void CHU_EnablePolling( void );

bool CHU_NewRES( void );
bool CHU_NewACK( void );
bool CHU_NewUID( void );
void CHU_ResetFlags( void );

void CHU_GetUID( uint8_t* uid );


/******************************************************************************/

#endif /* _CHU_H */

/* End of File ****************************************************************/
