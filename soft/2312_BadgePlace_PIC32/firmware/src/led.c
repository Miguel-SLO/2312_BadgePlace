/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    led.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "led.h"
#include "SerialTimer.h"
#include "TLC5973.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

LED_DATA ledData;

#define DATA_NUMBER 4
#define DATA_BITS 12

#define LED_NUMBER 3
#define LED_PULSES_TOTAL (DWS_PULSES_TOTAL + EOS_PULSES_TOTAL + GSL_PULSES_TOTAL)

#define PULSE_WIDTH_HIGH 127
#define PULSE_WIDTH_LOW  0
#define PULSE_PER_CYCLE 3

#define DWS_NUMBER LED_NUMBER
#define DWS_CYCLES 48
#define DWS_PULSES (DWS_CYCLES * PULSE_PER_CYCLE)
#define DWS_PULSES_TOTAL (DWS_PULSES * DWS_NUMBER)

#define EOS_NUMBER (LED_NUMBER - 1)
#define EOS_CYCLES 4
#define EOS_PULSES (EOS_CYCLES * PULSE_PER_CYCLE)
#define EOS_PULSES_TOTAL (EOS_PULSES * EOS_NUMBER)

#define GSL_NUMBER 1
#define GSL_CYCLES 10
#define GSL_PULSES (GSL_CYCLES * PULSE_PER_CYCLE)
#define GSL_PULSES_TOTAL (GSL_PULSES * GSL_NUMBER)

#define WRITE_COMMAND 0x3AA
#define MASK_BITS 0x800

#define COMMAND 0
#define BLUE    1
#define GREEN   2
#define RED     3

typedef enum
{
    SEQ_STATE_WAIT,
    SEQ_STATE_START,
    SEQ_STATE_FIRST,
    SEQ_STATE_DATA,
    SEQ_STATE_LAST,    
} SEQ_STATES;

typedef struct
{
    uint8_t i_data;
    uint8_t i_bit;
    uint8_t i_pulse;
    uint16_t data[DATA_NUMBER];
    uint16_t offset;    
    SEQ_STATES sequence;
} S_LED; 

S_LED A_LED[LED_NUMBER];

uint8_t LED_PULSE[LED_PULSES_TOTAL];

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void LED_Initialize ( void )

  Remarks:
    See prototype in led.h.
 */

void LED_Initialize ( void )
{    
    /* Place the App state machine in its initial state. */
    ledData.state    = LED_STATE_INIT;
    ledData.i_led = 0;
    
    SERTIM_Init();
    TLC_Init();
}


/******************************************************************************
  Function:
    void LED_Tasks ( void )

  Remarks:
    See prototype in led.h.
 */

void LED_Tasks ( void )
{    
    static uint8_t i_led = 0;
    static uint16_t i_color = 0;
    
    /* Check the application's current state. */
    switch ( ledData.state )
    {
        /* Application's initial state. */
        case LED_STATE_INIT:
        {
            
            ledData.state = LED_STATE_WAIT;
            TLC_Set(0,0x01, 0x10, 0xBB);
            break;
        }
        
        case LED_STATE_TASKS:
        {
            TLC_Set(i_led, i_color, 0, 0);
            i_color++;
            if(i_color >= 0xFFF)
            {
                i_color = 0;
                i_led++;
                if(i_led > 2)
                {
                    i_led = 0;
                }
            }
            ledData.state = LED_STATE_WAIT;
            break;
        }
        
        case LED_STATE_WAIT:
        {
            break;
        }
        

        /* Handle error in application's state machine. */
        default:
        {            
            break;
        }
    }
}

void LED_UpdateState(LED_STATES NewState)
{
    ledData.state = NewState;
}

/*******************************************************************************
 End of File
 */
