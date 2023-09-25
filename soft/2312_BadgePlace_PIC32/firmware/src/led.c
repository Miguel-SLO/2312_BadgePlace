#include "led.h"
#include "modules/TLC5973.h"

LED_DATA ledData;

void LED_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    ledData.state = LED_STATE_INIT;
    
    
}

void LED_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( ledData.state )
    {
        /* Application's initial state. */
        case LED_STATE_INIT:
        {            
            ledData.state = LED_STATE_SERVICE_TASKS;
            break;
        }

        case LED_STATE_SERVICE_TASKS:
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

/*******************************************************************************
 End of File
 */
