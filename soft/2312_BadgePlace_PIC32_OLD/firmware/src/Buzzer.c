
#include "app.h"
#include "Buzzer.h"

#define BUZZER_TMR DRV_TMR_INDEX_3 
#define BUZZER_OC DRV_OC_INDEX_1

#define NOTE_A3 220

typedef enum
{
    BUZ_STATE_INIT,
    BUZ_STATE_WAIT,
    BUZ_STATE_START,
    BUZ_STATE_PLAY,
    BUZ_STATE_STOP,
}BUZ_STATE;

typedef struct
{
    BUZ_STATE state;
    uint16_t note;
    uint16_t time;
    uint16_t counter;
}BUZ_DATA;

BUZ_DATA BUZ_Data;

void BUZ_Init( void )
{
    BUZ_Data.state = BUZ_STATE_INIT;
    BUZ_Data.note = 220;
    BUZ_Data.time = 300;
    BUZ_Data.counter = 0;
}

void BUZ_Tasks( void )
{
    switch(BUZ_Data.state)
    {
        case BUZ_STATE_INIT :
            BUZ_Data.state = BUZ_STATE_WAIT;
            break;
            
        case BUZ_STATE_WAIT :
            BUZ_Data.state = BUZ_STATE_START;
            break;
            
        case BUZ_STATE_START :
            //DRV_TMR2_Start();
            //DRV_OC1_Start();
            break;
            
        case BUZ_STATE_PLAY :
            if(BUZ_Data.counter >= BUZ_Data.time)
            {
                BUZ_Data.counter = 0;
                BUZ_Data.state = BUZ_STATE_STOP;
            }
            else
            {
                BUZ_Data.counter++;
            }
            break;
            
        case BUZ_STATE_STOP :
            DRV_OC1_Stop();
            BUZ_Data.state = BUZ_STATE_WAIT;
            break;
            
        default:
            break;
    }
}