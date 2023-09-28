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
 * File    		: app.c
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

#include "app.h"
#include "modules/TLC5973.h"
#include "driver/tmr/drv_tmr_mapping.h"

#define LED_WIFI TLC_DRV_ID_0

/******************************************************************************/

/* Timeout for turning off output (in milliseconds) */
#define APP_TIME_OUT_MS 7200000

/* Wait time to allow user to react (in milliseconds) */
#define APP_TIME_WAIT_MS 60000

/******************************************************************************/

/* Declaration of global application data */

APP_DATA appData;

/******************************************************************************/

/**
 * @brief APP_Initialize
 *
 * Initialize APP state machine
 *
 * @param void
 * @return void
 */
void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;
    
    appData.setup_rfid = APP_RFID_STATE_START;

    /* Initialize TLC5973 interface */
    TLC_Initialize();
    
    /* Start application's timer */
    DRV_TMR0_Start();
    
    /* Initialize timeout counter */
    CNT_Initialize(&appData.timeOut, 100);
    
    /* Initialize timeout counter */
    CNT_Initialize(&appData.cntSetup, 1200);
}

/******************************************************************************/

/**
 * @brief APP_Tasks
 *
 * Execute APP state machine, should be called cyclically
 *
 * @param void
 * @return void
 */
void APP_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
            if(CNT_Check(&appData.cntSetup))
            {
                TLC_SetAll(0xFF, 0xFF, 0xFF);
                TLC_SetAll(0, 0, 0);
                TLC_Transmit();
                
                appData.state = APP_STATE_SETUP_WIFI;
            }
            break;
        }

        case APP_STATE_SETUP_WIFI:
        {
            appData.state = APP_STATE_SETUP_RFID;
            break;
        }
        
        case APP_STATE_SETUP_RFID:
        {
            switch(appData.setup_rfid)
            {
                case APP_RFID_STATE_START:
                {
                    TLC_SetDriver(RFID_LED, 0x00, 0x066, 0xFFF);
                    TLC_Transmit();
                    appData.setup_rfid = APP_RFID_STATE_SETUP;
                    CNT_Reset(&appData.cntSetup);
                    break;
                }
                case APP_RFID_STATE_SETUP:
                {
                    if(CNT_Check(&appData.cntSetup))
                    {
                        CHU_RFID_EnablePolling();
                        appData.setup_rfid = APP_RFID_STATE_CHECK;
                        CNT_Reset(&appData.cntSetup);
                    }
                    break;
                }
                case APP_RFID_STATE_CHECK:
                {
                    if(CNT_Check(&appData.cntSetup))
                    {
                        if(!CHU_IsWaiting())
                        {
                            if(CHU_RFID_IsOk())
                            {
                                TLC_SetDriver(RFID_LED, 0x000, 0xFFF, 0x000);
                                appData.setup_rfid = APP_RFID_STATE_STOP;
                            }
                            else
                            {
                                TLC_SetDriver(RFID_LED, 0x000, 0x000, 0xFFF);
                                appData.setup_rfid = APP_RFID_STATE_START;
                                appData.state = APP_STATE_INIT;
                            }
                            TLC_Transmit();
                        }
                    }
                    break;
                }
                case APP_RFID_STATE_STOP:
                {
                    if(CNT_Check(&appData.cntSetup))
                    {
                        TLC_SetDriver(RFID_LED, 0x000, 0x000, 0x000);
                        TLC_Transmit();
                        appData.state = APP_STATE_IDLE;
                    }
                    break;
                }
            }
            break;
        }
        
        case APP_STATE_IDLE:
        {
            if(CHU_RFID_NewMessage())
            {
                CHU_RFID_GetMessage(appData.uuid);
                if(strcmp(appData.uuid, "321B4A90"))
                {
                    BZR_PlaySequence(BZR_SEQ_IMPERIAL);
                }
                break;
            }
            
            break;
        }
        
        case APP_STATE_ASKING:
        {
            break;
        }
        
        case APP_STATE_OFF:
        {
            break;
        }
        
        case APP_STATE_ON:
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

/* End of File ****************************************************************/
