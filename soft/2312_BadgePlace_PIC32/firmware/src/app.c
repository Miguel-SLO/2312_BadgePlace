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
#define LED_RFID TLC_DRV_ID_1
#define LED_TIME TLC_DRV_ID_2

/******************************************************************************/

/* Timeout for turning off output (in milliseconds) */
#define APP_TIME_OUT_MS 10000

/* Wait time to allow user to react (in milliseconds) */
#define APP_TIME_WAIT_MS 3000

/******************************************************************************/

/* Declaration of global application data */
APP_DATA appData;

uint8_t BADGES[][4] = {
    {0x34, 0x40, 0x06, 0x4A},
    {0x42, 0xB3, 0xC9, 0x8E},
    {0xB4, 0x69, 0x63, 0x5F},
    {0x11, 0x11, 0x11, 0x11},    
};

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
    appData.setup_wifi = APP_WIFI_STATE_START;
    
    appData.output = false;

    /* Initialize TLC5973 interface */
    TLC_Initialize();
    
    /* Start application's timer */
    DRV_TMR0_Start();
    
    /* Initialize timeout counter */
    CNT_Initialize(&appData.timeOut, APP_TIME_OUT_MS);
    CNT_Initialize(&appData.timeUser, APP_TIME_WAIT_MS);
    
    /* Initialize timeout counter */
    CNT_Initialize(&appData.cntSetup, 200);
    
    CNT_Initialize(&appData.cntRelay, 50);
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
                CNT_Set(&appData.cntSetup, 200);                
                appData.state = APP_STATE_SETUP_WIFI;
            }
            break;
        }

        case APP_STATE_SETUP_WIFI:
        {
            switch(appData.setup_wifi)
            {
                case APP_WIFI_STATE_START:
                {
                    if(CNT_Check(&appData.cntSetup))
                    {
                        TLC_SetDriver(LED_WIFI, 0x00, 0x0F6, 0xFFF);
                        TLC_Transmit();
                        ESP_SendCommand(AT_CMD_CWJAP);
                        CNT_Set(&appData.cntSetup, 2000); 
                        appData.setup_wifi = APP_WIFI_STATE_SETUP;
                    }
                    break;
                }
                case APP_WIFI_STATE_SETUP:
                {
                    if(CNT_Check(&appData.cntSetup))
                    {
                        if(ESP_WIFI_Confirmed())
                        {
                            TLC_SetDriver(LED_WIFI, 0x000, 0xFFF, 0x000);
                            TLC_Transmit();
                            ESP_SendCommand(AT_CMD_CIPSTART);
                            appData.setup_wifi = APP_WIFI_STATE_TCP;
                        }
                        else
                        {
                            TLC_SetDriver(LED_WIFI, 0x000, 0x000, 0xFFF);
                            TLC_Transmit();
                            appData.setup_wifi = APP_WIFI_STATE_START;
                        }
                        
                        CNT_Set(&appData.cntSetup, 1000);
                    }
                    break;
                }
                case APP_WIFI_STATE_TCP:
                {
                    if(ESP_TCP_Connected())
                    {
                        TLC_SetDriver(LED_WIFI, 0xFFF, 0x000, 0x000);
                        TLC_Transmit();
                        appData.setup_wifi = APP_WIFI_STATE_STOP;
                    }
                    break;
                }
                case APP_WIFI_STATE_STOP:
                {
                    if(CNT_Check(&appData.cntSetup))
                    {
                        /* Turn LED off */
                        TLC_SetDriver(LED_WIFI, 0x000, 0x000, 0x000);
                        TLC_Transmit();
                        ESP_SendCommand(AT_CMD_CIPSEND);
                        appData.setup_wifi = APP_WIFI_STATE_START;
                        appData.state = APP_STATE_SETUP_RFID;
                    }
                    break;
                }
            }
            break;
        }
        
        case APP_STATE_SETUP_RFID:
        {
            switch(appData.setup_rfid)
            {
                case APP_RFID_STATE_START:
                {
                    TLC_SetDriver(LED_RFID, 0x00, 0x066, 0xFFF);
                    TLC_Transmit();
                    CHU_EnablePolling();
                    appData.setup_rfid = APP_RFID_STATE_SETUP;
                    break;
                }
                case APP_RFID_STATE_SETUP:
                {
                    if(CHU_NewRES())
                    {
                        if(CHU_NewACK())
                        {
                            TLC_SetDriver(LED_RFID, 0x000, 0xFFF, 0x000);
                            appData.setup_rfid = APP_RFID_STATE_STOP;
                        }
                        else
                        {
                            TLC_SetDriver(LED_RFID, 0x000, 0x000, 0xFFF);
                            appData.setup_rfid = APP_RFID_STATE_START;
                        }
                        CHU_ResetFlags();
                        TLC_Transmit();
                    }
                    break;
                }
                case APP_RFID_STATE_STOP:
                {
                    if(CNT_Check(&appData.cntSetup))
                    {
                        /* Turn LED off */
                        TLC_SetDriver(LED_RFID, 0x000, 0x000, 0x000);
                        TLC_Transmit();

                        /* Turn off the relay */
                        CNT_Reset(&appData.cntRelay);
                        appData.state = APP_STATE_OFF;
                        break;
                    }
                }
            }
            break;
        }
        
        case APP_STATE_IDLE:
        {
            if(CNT_Check(&appData.timeOut) && appData.output)
            {
                BZR_PlaySequence(BZR_SEQ_TIMEOUT);
                TLC_SetDriver(LED_TIME, 0x000, 0x000, 0xFF0);
                TLC_Transmit();
                appData.user = true;
                CNT_Reset(&appData.timeUser);
            }
            
            if(CNT_Check(&appData.timeUser) && appData.user)
            {
                appData.user = false;
                TLC_SetDriver(LED_TIME, 0x000, 0x000, 0x000);
                TLC_Transmit();
                CNT_Reset(&appData.cntRelay);
                appData.state = APP_STATE_OFF;
            }
            
            if(CHU_NewUID())
            {
                CHU_ResetFlags();
                TLC_SetDriver(LED_TIME, 0x000, 0x000, 0x000);

                CHU_GetUID(appData.uuid);
                
                ESP_SendCommand((char *)(appData.uuid));
                
                if(!memcmp(appData.uuid, &BADGES[0], 4))
                {
                    if(appData.output && !appData.user)
                    {
                        BZR_PlaySequence(BZR_SEQ_MARIO_OVER);
                        appData.state = APP_STATE_OFF; 
                    }
                    else
                    {
                        BZR_PlaySequence(BZR_SEQ_MARIO);
                        appData.user = false;
                        appData.state = APP_STATE_ON;  
                    }
                    
                }
                else if(!memcmp(appData.uuid, &BADGES[1], 4))
                {
                    if(appData.output && !appData.user)
                    {
                        BZR_PlaySequence(BZR_SEQ_TURNOFF);
                        appData.state = APP_STATE_OFF;
                    }
                    else
                    {
                        BZR_PlaySequence(BZR_SEQ_IMPERIAL);
                        appData.user = false;
                        appData.state = APP_STATE_ON;
                    }
                    
                }
                else if(!memcmp(appData.uuid, &BADGES[2], 4))
                {
                    if(appData.output && !appData.user)
                    {
                        BZR_PlaySequence(BZR_SEQ_TURNOFF);
                        appData.state = APP_STATE_OFF;
                    }
                    else
                    {
                        BZR_PlaySequence(BZR_SEQ_ZELDA);
                        appData.user = false;
                        appData.state = APP_STATE_ON;
                    }
                    
                }
                else if(!memcmp(appData.uuid, &BADGES[3], 4))
                {
                    if(appData.output && !appData.user)
                    {
                        BZR_PlaySequence(BZR_SEQ_TURNOFF);
                        appData.state = APP_STATE_OFF;
                    }
                    else
                    {
                        BZR_PlaySequence(BZR_SEQ_PACMAN);
                        appData.user = false;
                        appData.state = APP_STATE_ON;
                    }
                    
                }
                
                else
                {
                    BZR_PlaySequence(BZR_SEQ_ERROR);
                    appData.state = APP_STATE_OFF;
                }
                
                CNT_Reset(&appData.cntRelay);
                
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
            AC_RSTOn();
            
            if(CNT_Check(&appData.cntRelay))
            {
                AC_RSTOff();
                
                appData.output = false;
                appData.state = APP_STATE_IDLE;
            }            
            break;
        }
        
        case APP_STATE_ON:
        {
            AC_SETOn();
            if(CNT_Check(&appData.cntRelay))
            {
                AC_SETOff();
                appData.output = true;
                CNT_Reset(&appData.timeOut);                
                appData.state = APP_STATE_IDLE;
            }
            
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
