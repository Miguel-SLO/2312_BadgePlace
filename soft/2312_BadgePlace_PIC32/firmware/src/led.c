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
    uint32_t i_init;
    
    /* Place the App state machine in its initial state. */
    ledData.state    = LED_STATE_INIT;
    ledData.i_led = 0;
    
    /* LEDS array initial state */
    for( i_init = 0 ; i_init < LED_NUMBER ; i_init++ )
    {
        A_LED[i_init].data[COMMAND] = WRITE_COMMAND;
        A_LED[i_init].data[BLUE]    = 0x0000;
        A_LED[i_init].data[GREEN]   = 0x0000;
        A_LED[i_init].data[RED]     = 0x0000;
        A_LED[i_init].offset = i_init * (DWS_PULSES + EOS_PULSES);
        A_LED[i_init].i_bit = 0;
        A_LED[i_init].i_data = 0;
        A_LED[i_init].i_pulse = 0;
        A_LED[i_init].sequence = SEQ_STATE_START;
    }
    
    /* LEDS pulse array initial state */
    for( i_init = 0 ; i_init < LED_PULSES_TOTAL ; i_init++ )
    {
        LED_PULSE[i_init] = 0x00;
    }

    
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void LED_Tasks ( void )

  Remarks:
    See prototype in led.h.
 */

void LED_Tasks ( void )
{    
    /* Check the application's current state. */
    switch ( ledData.state )
    {
        /* Application's initial state. */
        case LED_STATE_INIT:
        {
            ledData.state = LED_STATE_WAIT;
            break;
        }
        
        case LED_STATE_WAIT:
        {
            break;
        }
        
        case LED_STATE_START:
        {
            DRV_TMR1_Start();
            DRV_OC0_Start();
            ledData.state = LED_STATE_WAIT;
            break;
        }
        
        case LED_STATE_STOP:
        {
            DRV_TMR1_Stop();
            DRV_OC0_Stop();
            ledData.state = LED_STATE_WAIT;
            break;
        }
            
        case LED_STATE_CONVERT:
        {
            LED_BinaryConvert(ledData.i_led);
            
            if(A_LED[ledData.i_led].sequence == SEQ_STATE_WAIT)
            {
                ledData.i_led++;
            }
            
            if(ledData.i_led >= LED_NUMBER)
            {
                ledData.state = LED_STATE_START;
            }
        }

        /* Handle error in application's state machine. */
        default:
        {            
            break;
        }
    }
}

void LED_SetLed( uint8_t led_id, uint16_t red, uint16_t green, uint16_t blue )
{
    A_LED[led_id].data[RED]   = red;
    A_LED[led_id].data[GREEN] = green;
    A_LED[led_id].data[BLUE]  = blue;
    
    A_LED[led_id].sequence = SEQ_STATE_START;    
    ledData.i_led = 0;
    ledData.state = LED_STATE_CONVERT;
}

void LED_BinaryConvert( uint8_t led_id )
{    
    switch(A_LED[led_id].sequence)
    {
        case SEQ_STATE_WAIT:
            /* Waiting for a new data */
            break;
        
        case SEQ_STATE_START:
            A_LED[led_id].sequence = SEQ_STATE_FIRST;
            break;
            
        case SEQ_STATE_FIRST:
            LED_PULSE[A_LED[led_id].i_pulse + A_LED[led_id].offset] = PULSE_WIDTH_HIGH;
            A_LED[led_id].i_pulse++;
            A_LED[led_id].sequence = SEQ_STATE_DATA;
            break;

        case SEQ_STATE_DATA:            
            if(A_LED[led_id].data[A_LED[led_id].i_data] & (MASK_BITS >> A_LED[led_id].i_bit))
            {
                LED_PULSE[A_LED[led_id].i_pulse + A_LED[led_id].offset] = PULSE_WIDTH_HIGH;
            }
            else
            {
                LED_PULSE[A_LED[led_id].i_pulse + A_LED[led_id].offset] = PULSE_WIDTH_LOW;
            }
            A_LED[led_id].i_pulse++;
            A_LED[led_id].sequence = SEQ_STATE_LAST;
            break;

        case SEQ_STATE_LAST:
            LED_PULSE[A_LED[led_id].i_pulse + A_LED[led_id].offset] = PULSE_WIDTH_LOW;
            A_LED[led_id].i_pulse++;
            A_LED[led_id].i_bit++;
            
            A_LED[led_id].sequence = SEQ_STATE_FIRST;
            
            if(A_LED[led_id].i_bit >= DATA_BITS)
            {
                A_LED[led_id].i_bit = 0;
                A_LED[led_id].i_data++;

                if(A_LED[led_id].i_data >= DATA_NUMBER)
                {
                    A_LED[led_id].i_data = 0;
                    A_LED[led_id].i_pulse = 0;
                    A_LED[led_id].sequence = SEQ_STATE_WAIT;
                }
            }
            
            break;
            
        default:
            break;
    }              
}


void LED_Callback( void )
{
    static uint32_t i_Pulse = 0;
    
    DEBUGOn();
    
    DRV_OC0_PulseWidthSet(LED_PULSE[i_Pulse]);    
    
    if(i_Pulse >= LED_PULSES_TOTAL)
    {
        i_Pulse = 0;
        ledData.state = LED_STATE_STOP;
    }
    else
    {
        i_Pulse++;
    }
    
    DEBUGOff();
}

/*******************************************************************************
 End of File
 */
