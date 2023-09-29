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
 * File    		: app.h
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing global state machine
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

#ifndef _APP_H
#define _APP_H

/******************************************************************************/

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "system_config.h"
#include "system_definitions.h"
#include "modules/counter.h"

/******************************************************************************/



/* Application states */
typedef enum
{
	APP_STATE_INIT,
    APP_STATE_IDLE,
    APP_STATE_SETUP_WIFI,
    APP_STATE_SETUP_RFID,
    APP_STATE_ASKING,
    APP_STATE_OFF,
    APP_STATE_ON,  
} APP_STATES;

typedef enum
{
    APP_RFID_STATE_START,
    APP_RFID_STATE_SETUP,
    APP_RFID_STATE_CHECK,
    APP_RFID_STATE_STOP,
}APP_RFID_STATES;

/******************************************************************************/

/* Structure to hold application data */
typedef struct
{
    /* The application's current state */
    APP_STATES state;
    
    APP_RFID_STATES setup_rfid;
    
    char uuid[8];
    
    S_Counter cntSetup;
    
    S_Counter cntRelay;
    
    /* Timeout counter used to turn off output */
    S_Counter timeOut;
    S_Counter timeUser;
    
    bool output;
    bool user;

} APP_DATA;

/******************************************************************************/

/**
 * @brief APP_Initialize
 *
 * Initialize APP state machine
 *
 * @param void
 * @return void
 */
void APP_Initialize ( void );

/******************************************************************************/

/**
 * @brief APP_Tasks
 *
 * Execute APP state machine, should be called cyclically
 *
 * @param void
 * @return void
 */
void APP_Tasks ( void );

/******************************************************************************/

#endif /* _APP_H */

/* End of File ****************************************************************/
