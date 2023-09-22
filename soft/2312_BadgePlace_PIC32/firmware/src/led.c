#include "led.h"
#include "modules/TLC5973.h"

LED_DATA ledData;

void LED_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    ledData.state = LED_STATE_INIT;
    
    TLC_Initialize();
    
//    TLC_Set(0, 0x00, 0x00, 0x00);
//    TLC_Set(1, 0x00, 0x00, 0x00);
//    TLC_Set(2, 0x00, 0x00, 0x00);
    
    //STR_Start();
}

void LED_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( ledData.state )
    {
        /* Application's initial state. */
        case LED_STATE_INIT:
        {
            //TLC_SetDriver(0, 250, 200, 100);
            TLC_SetDriver(1, 200, 3000, 0);
            TLC_SetDriver(2, 0, 200, 1000);
            TLC_Transmit();
            
            ledData.state = LED_STATE_SERVICE_TASKS;
            break;
        }

        case LED_STATE_SERVICE_TASKS:
        {
            
            TLC_SetDriver(0, 250, 200, 100);
            TLC_Transmit();
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
