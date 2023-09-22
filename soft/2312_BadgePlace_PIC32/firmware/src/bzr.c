#include "bzr.h"
#include "driver/tmr/drv_tmr_static.h"

#define BZR_TMR_ID TMR_ID_3
#define BZR_TMR_TICK_US
#define BZR_OC_ID OC_ID_5

BZR_DATA bzrData;

uint16_t BZR_SEQUENCE_MARIO[BZR_SEQ_MARIO][2] = {
    {500    , 100   },
    {0      , 500   },
    {500    , 100   },
};

void BZR_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    bzrData.state = BZR_STATE_INIT;
    bzrData.newSequence = false;
}

void BZR_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( bzrData.state )
    {
        /* Application's initial state. */
        case BZR_STATE_INIT:
        {
            bzrData.state = BZR_STATE_IDLE;
            break;
        }
        
        case BZR_STATE_IDLE:
        {
            if(bzrData.newSequence)
            {
                
                
                bzrData.state = BZR_STATE_NOTE;
            }
            break;
        }
        
        case BZR_STATE_NOTE:
        {
            BZR_SetFrequency();
            PLIB_TMR_Start(BZR_TMR_ID);                
            PLIB_OC_Enable(BZR_OC_ID);
            bzrData.state = BZR_STATE_PLAYING;
            break;
        }
        
        case BZR_STATE_PLAYING:
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

bool BZR_SetFrequency(uint16_t frequency)
{
    
}

bool BZR_PlaySequence(E_BZR_SEQ song)
{
    
}

 

/*******************************************************************************
 End of File
 */
