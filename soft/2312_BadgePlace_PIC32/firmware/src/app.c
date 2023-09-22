#include "app.h"
#include "modules/TLC5973.h"

APP_DATA appData;

S_Counter APP_WAIT_5S;

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;

    CNT_Initialize(&APP_WAIT_5S, 5000);
    
    /* Start timers */
    DRV_TMR0_Start();
}

void APP_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
       
            if(CNT_Check(&APP_WAIT_5S))
            {
                
                BZR_PlaySequence(BZR_SEQ_TEST);
                appData.state = APP_STATE_SERVICE_TASKS;
            }

            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
            
        
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

/*******************************************************************************
 End of File
 */
