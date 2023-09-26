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
    
    appData.wifiState = APP_WIFI_SEND;

    /* Initialize TLC5973 interface */
    TLC_Initialize();
    
    DRV_TMR0_Start();
    
    
    /* Initialize timeout counter */
    CNT_Initialize(&appData.timeOut, 10);
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
            AC_SETOn();
            appData.state = APP_STATE_IDLE;
            break;
        }

        case APP_STATE_IDLE:
        {
            if(CNT_Check(&appData.timeOut))
            {
                AC_SETOff();
                appData.state = APP_STATE_SETUP_WIFI;
            }
            break;
        }
        
        case APP_STATE_SETUP_WIFI:
        {
//            switch(appData.wifiState)
//            {
//                case APP_WIFI_SEND:
//                {
//                    ESP_SendCommand(AT_CMD_CWJAP);
//                    TLC_SetDriver(LED_WIFI, 250, 250, 0);
//                    appData.wifiState = APP_WIFI_CONNECT;
//                    break;
//                }
//
//                case APP_WIFI_CONNECT:
//                {
//                    if(strcmp(ESP_GetData(), "WIFI CONNECTED"))
//                    {
//                        TLC_SetDriver(LED_WIFI, 250, 0, 250);
//                        appData.wifiState = APP_WIFI_IP;                        
//                    }
//                    break;
//                }
//
//                case APP_WIFI_IP:
//                {
//                    if(strcmp(ESP_GetData(), "WIFI GOT IP"))
//                    {
//                        TLC_SetDriver(LED_WIFI, 250, 0, 250);
//                        appData.wifiState = APP_WIFI_SEND;
//                        appData.state = APP_STATE_SETUP_RFID;
//                    }
//                    break;
//                }
//                
//                case APP_WIFI_ERROR:
//                {
//                    break;
//                }
//            }
            break;
        }
        
        case APP_STATE_SETUP_RFID:
        {
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
