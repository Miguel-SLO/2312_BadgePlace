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
 * File    		: buzzer.c
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing buzzer state machine and sequences
 * 
 *                Thanks to robsoncouto on GitHub for musics !
 *                https://github.com/robsoncouto/arduino-songs.git
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

#include "bzr.h"
#include "peripheral/oc/plib_oc.h"

/******************************************************************************/

/* Define the timer used by the buzzer */
#define BZR_TMR_ID TMR_ID_3

/* Define the OC output used by the buzzer */
#define BZR_OC_ID OC_ID_5

/* Set the volume of the buzzer by changing duty cycle */
#define BZR_VOLUME 0.02

/******************************************************************************/

/* Define frequencies of notes in Hz */
#define NOTE_B0  31
#define NOTE_C1  33
#define NOTE_CS1 35
#define NOTE_D1  37
#define NOTE_DS1 39
#define NOTE_E1  41
#define NOTE_F1  44
#define NOTE_FS1 46
#define NOTE_G1  49
#define NOTE_GS1 52
#define NOTE_A1  55
#define NOTE_AS1 58
#define NOTE_B1  62
#define NOTE_C2  65
#define NOTE_CS2 69
#define NOTE_D2  73
#define NOTE_DS2 78
#define NOTE_E2  82
#define NOTE_F2  87
#define NOTE_FS2 93
#define NOTE_G2  98
#define NOTE_GS2 104
#define NOTE_A2  110
#define NOTE_AS2 117
#define NOTE_B2  123
#define NOTE_C3  131
#define NOTE_CS3 139
#define NOTE_D3  147
#define NOTE_DS3 156
#define NOTE_E3  165
#define NOTE_F3  175
#define NOTE_FS3 185
#define NOTE_G3  196
#define NOTE_GS3 208
#define NOTE_A3  220
#define NOTE_AS3 233
#define NOTE_B3  247
#define NOTE_C4  262
#define NOTE_CS4 277
#define NOTE_D4  294
#define NOTE_DS4 311
#define NOTE_E4  330
#define NOTE_F4  349
#define NOTE_FS4 370
#define NOTE_G4  392
#define NOTE_GS4 415
#define NOTE_A4  440
#define NOTE_AS4 466
#define NOTE_B4  494
#define NOTE_C5  523
#define NOTE_CS5 554
#define NOTE_D5  587
#define NOTE_DS5 622
#define NOTE_E5  659
#define NOTE_F5  698
#define NOTE_FS5 740
#define NOTE_G5  784
#define NOTE_GS5 831
#define NOTE_A5  880
#define NOTE_AS5 932
#define NOTE_B5  988
#define NOTE_C6  1047
#define NOTE_CS6 1109
#define NOTE_D6  1175
#define NOTE_DS6 1245
#define NOTE_E6  1319
#define NOTE_F6  1397
#define NOTE_FS6 1480
#define NOTE_G6  1568
#define NOTE_GS6 1661
#define NOTE_A6  1760
#define NOTE_AS6 1865
#define NOTE_B6  1976
#define NOTE_C7  2093
#define NOTE_CS7 2217
#define NOTE_D7  2349
#define NOTE_DS7 2489
#define NOTE_E7  2637
#define NOTE_F7  2794
#define NOTE_FS7 2960
#define NOTE_G7  3136
#define NOTE_GS7 3322
#define NOTE_A7  3520
#define NOTE_AS7 3729
#define NOTE_B7  3951
#define NOTE_C8  4186
#define NOTE_CS8 4435
#define NOTE_D8  4699
#define NOTE_DS8 4978
#define REST      0

/******************************************************************************/

/* All sequences are defined here */

/* Test sequence */
int16_t BZR_SEQUENCE_TEST[] = {
    NOTE_A4,-4, NOTE_A4,-4, NOTE_A4,16, NOTE_A4,16, NOTE_A4,16,
};

/* Super Mario Bros theme - by Koji Kondo*/
int16_t BZR_SEQUENCE_MARIO[] = {
  NOTE_E5,  8,  NOTE_E5,8,  REST,8, NOTE_E5,8,  REST,8, NOTE_C5,8, NOTE_E5,8, //1
  NOTE_G5,4, REST,4, NOTE_G4,8, REST,4, 
  NOTE_C5,-4, NOTE_G4,8, REST,4, NOTE_E4,-4, // 3
  NOTE_A4,4, NOTE_B4,4, NOTE_AS4,8, NOTE_A4,4,
  NOTE_G4,-8, NOTE_E5,-8, NOTE_G5,-8, NOTE_A5,4, NOTE_F5,8, NOTE_G5,8,
  REST,8, NOTE_E5,4,NOTE_C5,8, NOTE_D5,8, NOTE_B4,-4,
  NOTE_C5,-4, NOTE_G4,8, REST,4, NOTE_E4,-4, // repeats from 3
  NOTE_A4,4, NOTE_B4,4, NOTE_AS4,8, NOTE_A4,4,
  NOTE_G4,-8, NOTE_E5,-8, NOTE_G5,-8, NOTE_A5,4, NOTE_F5,8, NOTE_G5,8,
  REST,8, NOTE_E5,4,NOTE_C5,8, NOTE_D5,8, NOTE_B4,-4,
  REST,4, NOTE_G5,8, NOTE_FS5,8, NOTE_F5,8, NOTE_DS5,4, NOTE_E5,8,//7
  REST,8, NOTE_GS4,8, NOTE_A4,8, NOTE_C4,8, REST,8, NOTE_A4,8, NOTE_C5,8, NOTE_D5,8,
  REST,4, NOTE_DS5,4, REST,8, NOTE_D5,-4,
  NOTE_C5,2, REST,2,
  REST,4, NOTE_G5,8, NOTE_FS5,8, NOTE_F5,8, NOTE_DS5,4, NOTE_E5,8,//repeats from 7
  REST,8, NOTE_GS4,8, NOTE_A4,8, NOTE_C4,8, REST,8, NOTE_A4,8, NOTE_C5,8, NOTE_D5,8,
  REST,4, NOTE_DS5,4, REST,8, NOTE_D5,-4,
  NOTE_C5,2, REST,2,
  NOTE_C5,8, NOTE_C5,4, NOTE_C5,8, REST,8, NOTE_C5,8, NOTE_D5,4,//11
  NOTE_E5,8, NOTE_C5,4, NOTE_A4,8, NOTE_G4,2,
  NOTE_C5,8, NOTE_C5,4, NOTE_C5,8, REST,8, NOTE_C5,8, NOTE_D5,8, NOTE_E5,8,//13
  REST,1, 
  NOTE_C5,8, NOTE_C5,4, NOTE_C5,8, REST,8, NOTE_C5,8, NOTE_D5,4,
  NOTE_E5,8, NOTE_C5,4, NOTE_A4,8, NOTE_G4,2,
  NOTE_E5,8, NOTE_E5,8, REST,8, NOTE_E5,8, REST,8, NOTE_C5,8, NOTE_E5,4,
  NOTE_G5,4, REST,4, NOTE_G4,4, REST,4, 
  NOTE_C5,-4, NOTE_G4,8, REST,4, NOTE_E4,-4, // 19
  NOTE_A4,4, NOTE_B4,4, NOTE_AS4,8, NOTE_A4,4,
  NOTE_G4,-8, NOTE_E5,-8, NOTE_G5,-8, NOTE_A5,4, NOTE_F5,8, NOTE_G5,8,
  REST,8, NOTE_E5,4, NOTE_C5,8, NOTE_D5,8, NOTE_B4,-4,
  NOTE_C5,-4, NOTE_G4,8, REST,4, NOTE_E4,-4, // repeats from 19
  NOTE_A4,4, NOTE_B4,4, NOTE_AS4,8, NOTE_A4,4,
  NOTE_G4,-8, NOTE_E5,-8, NOTE_G5,-8, NOTE_A5,4, NOTE_F5,8, NOTE_G5,8,
  REST,8, NOTE_E5,4, NOTE_C5,8, NOTE_D5,8, NOTE_B4,-4,
  NOTE_E5,8, NOTE_C5,4, NOTE_G4,8, REST,4, NOTE_GS4,4,//23
  NOTE_A4,8, NOTE_F5,4, NOTE_F5,8, NOTE_A4,2,
  NOTE_D5,-8, NOTE_A5,-8, NOTE_A5,-8, NOTE_A5,-8, NOTE_G5,-8, NOTE_F5,-8,
  NOTE_E5,8, NOTE_C5,4, NOTE_A4,8, NOTE_G4,2, //26
  NOTE_E5,8, NOTE_C5,4, NOTE_G4,8, REST,4, NOTE_GS4,4,
  NOTE_A4,8, NOTE_F5,4, NOTE_F5,8, NOTE_A4,2,
  NOTE_B4,8, NOTE_F5,4, NOTE_F5,8, NOTE_F5,-8, NOTE_E5,-8, NOTE_D5,-8,
  NOTE_C5,8, NOTE_E4,4, NOTE_E4,8, NOTE_C4,2,
  NOTE_E5,8, NOTE_C5,4, NOTE_G4,8, REST,4, NOTE_GS4,4,//repeats from 23
  NOTE_A4,8, NOTE_F5,4, NOTE_F5,8, NOTE_A4,2,
  NOTE_D5,-8, NOTE_A5,-8, NOTE_A5,-8, NOTE_A5,-8, NOTE_G5,-8, NOTE_F5,-8,
  NOTE_E5,8, NOTE_C5,4, NOTE_A4,8, NOTE_G4,2, //26
  NOTE_E5,8, NOTE_C5,4, NOTE_G4,8, REST,4, NOTE_GS4,4,
  NOTE_A4,8, NOTE_F5,4, NOTE_F5,8, NOTE_A4,2,
  NOTE_B4,8, NOTE_F5,4, NOTE_F5,8, NOTE_F5,-8, NOTE_E5,-8, NOTE_D5,-8,
  NOTE_C5,8, NOTE_E4,4, NOTE_E4,8, NOTE_C4,2,
  NOTE_C5,8, NOTE_C5,4, NOTE_C5,8, REST,8, NOTE_C5,8, NOTE_D5,8, NOTE_E5,8,
  REST,1,
  NOTE_C5,8, NOTE_C5,4, NOTE_C5,8, REST,8, NOTE_C5,8, NOTE_D5,4, //33
  NOTE_E5,8, NOTE_C5,4, NOTE_A4,8, NOTE_G4,2,
  NOTE_E5,8, NOTE_E5,8, REST,8, NOTE_E5,8, REST,8, NOTE_C5,8, NOTE_E5,4,
  NOTE_G5,4, REST,4, NOTE_G4,4, REST,4, 
  NOTE_E5,8, NOTE_C5,4, NOTE_G4,8, REST,4, NOTE_GS4,4,
  NOTE_A4,8, NOTE_F5,4, NOTE_F5,8, NOTE_A4,2,
  NOTE_D5,-8, NOTE_A5,-8, NOTE_A5,-8, NOTE_A5,-8, NOTE_G5,-8, NOTE_F5,-8,
  NOTE_E5,8, NOTE_C5,4, NOTE_A4,8, NOTE_G4,2, //40
  NOTE_E5,8, NOTE_C5,4, NOTE_G4,8, REST,4, NOTE_GS4,4,
  NOTE_A4,8, NOTE_F5,4, NOTE_F5,8, NOTE_A4,2,
  NOTE_B4,8, NOTE_F5,4, NOTE_F5,8, NOTE_F5,-8, NOTE_E5,-8, NOTE_D5,-8,
  NOTE_C5,8, NOTE_E4,4, NOTE_E4,8, NOTE_C4,2,
  //game over sound
  NOTE_C5,-4, NOTE_G4,-4, NOTE_E4,4, //45
  NOTE_A4,-8, NOTE_B4,-8, NOTE_A4,-8, NOTE_GS4,-8, NOTE_AS4,-8, NOTE_GS4,-8,
  NOTE_G4,8, NOTE_D4,8, NOTE_E4,-2,  

};
/* Dart Vader theme (Imperial March) - Star wars */
int16_t BZR_SEQUENCE_IMPERIAL[] = {
    NOTE_A4,  -4, NOTE_A4,  -4, NOTE_A4,  16, NOTE_A4,  16,
    NOTE_A4,  16, NOTE_A4,  16, NOTE_F4,   8, REST,      8,
    NOTE_A4,  -4, NOTE_A4,  -4, NOTE_A4,  16, NOTE_A4,  16,
    NOTE_A4,  16, NOTE_A4,  16, NOTE_F4,   8, REST,      8,
    NOTE_A4,   4, NOTE_A4,   4, NOTE_A4,   4,
    NOTE_F4,  -8, NOTE_C5,  16, NOTE_A4,   4,
    NOTE_F4,  -8, NOTE_C5,  16, NOTE_A4,   2,
    NOTE_E5,   4, NOTE_E5,   4, NOTE_E5,   4,
    NOTE_F5,  -8, NOTE_C5,  16, NOTE_A4,   4,
    NOTE_F4,  -8, NOTE_C5,  16, NOTE_A4,   2,
    NOTE_A5,   4, NOTE_A4,  -8, NOTE_A4,  16,
    NOTE_A5,   4, NOTE_GS5, -8, NOTE_G5,  16,
    NOTE_DS5, 16, NOTE_D5,  16, NOTE_DS5,  8, REST,      8,
    NOTE_A4,   8, NOTE_DS5,  4, NOTE_D5,  -8, NOTE_CS5, 16,
    NOTE_C5,  16, NOTE_B4,  16, NOTE_C5,  16, REST,      8,
    NOTE_F4,   8, NOTE_GS4,  4, NOTE_F4,  -8, NOTE_A4, -16,
    NOTE_C5,   4, NOTE_A4,  -8, NOTE_C5,  16, NOTE_E5,   2,
    NOTE_A5,   4, NOTE_A4,  -8, NOTE_A4,  16,
    NOTE_A5,   4, NOTE_GS5, -8, NOTE_G5,  16,
    NOTE_DS5, 16, NOTE_D5,  16, NOTE_DS5,  8, REST,      8,
    NOTE_A4,   8, NOTE_DS5,  4, NOTE_D5,  -8, NOTE_CS5, 16,
    NOTE_C5,  16, NOTE_B4,  16, NOTE_C5,  16, REST,      8,
    NOTE_F4,   8, NOTE_GS4,  4, NOTE_F4,  -8, NOTE_A4, -16,
    NOTE_A4,   4, NOTE_F4,  -8, NOTE_C5,  16,
    NOTE_A4,   2,
};

/******************************************************************************/

/* Hold informations about sequences */
S_BZR_SEQ BZR_SEQUENCES[] = {
    /* TESTING */
    {
        .tempo = 300,
        .size = sizeof(BZR_SEQUENCE_TEST),
        .notes = BZR_SEQUENCE_TEST,
    },
    /* MARIO BROS SONG */
    {
        .tempo = 200,
        .size = sizeof(BZR_SEQUENCE_MARIO),
        .notes = BZR_SEQUENCE_MARIO,
    },
    /* IMPERIAL MARCH */
    {
        .tempo = 120,
        .size = sizeof(BZR_SEQUENCE_IMPERIAL),
        .notes = BZR_SEQUENCE_IMPERIAL,
    },
};

/******************************************************************************/

/* Declaration of global application data */
BZR_DATA bzrData;

/******************************************************************************/

/* Static functions declaration */

static void BZR_SetFrequency(uint16_t frequency);
static void BZR_SetCounter(int8_t tempo);

/******************************************************************************/

/**
 * @brief BZR_Initialize
 *
 * Initialize buzzer state machine
 *
 * @param void
 * @return void
 */
void BZR_Initialize ( void )
{
    /* Place the buzzer state machine in its initial state. */
    bzrData.state = BZR_STATE_IDLE;
    
    /* Flag to indicate a new sequence available */
    bzrData.newSequence = false;
    
    /* Calculate timer frequency only one time */
    bzrData.tmrFrequency = (uint32_t)(SYS_CLK_FREQ /
                                    PLIB_TMR_PrescaleGet(BZR_TMR_ID));
    
    /* Init counter used to count time of notes */
    CNT_Initialize(&bzrData.counterPlay, 0x00);
}

/******************************************************************************/

/**
 * @brief BZR_Tasks
 *
 * Execute buzzer state machine, should be called cyclically
 *
 * @param void
 * @return void
 */
void BZR_Tasks ( void )
{

    /* Check the application's current state. */
    switch ( bzrData.state )
    {        
        /* Buzzer waiting for new sequence */
        case BZR_STATE_IDLE:
        {
            if(bzrData.newSequence)
            {
                bzrData.state = BZR_STATE_NOTE;
            }
            break;
        }
        
        /* Buzzer getting the note to play */
        case BZR_STATE_NOTE:
        {
            BZR_SetFrequency(bzrData.currentNote[0]);
            BZR_SetCounter(bzrData.currentNote[1]);
            bzrData.state = BZR_STATE_PLAYING;
            break;
        }
        
        /* Buzzer playing the note and waiting */
        case BZR_STATE_PLAYING:
        {
            if(CNT_Check(&bzrData.counterPlay))
            {
                if(bzrData.currentNote >= bzrData.lastNote)
                {
                    PLIB_TMR_Stop(BZR_TMR_ID);
                    PLIB_OC_Disable(BZR_OC_ID);
                    bzrData.newSequence = false;
                    bzrData.state = BZR_STATE_IDLE;
                }
                else
                {
                    bzrData.currentNote += 2;
                    bzrData.state = BZR_STATE_NOTE;
                }
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

/**
 * @brief BZR_PlaySequence
 *
 * Play a music sequence using the state machine
 *
 * @param   E_BZR_SEQ song  Call the music you wann play !
 * @return  void
 */
void BZR_PlaySequence(E_BZR_SEQ song)
{   
    bzrData.sequence = BZR_SEQUENCES[song].notes;
    
    bzrData.tempo = BZR_SEQUENCES[song].tempo;

    bzrData.currentNote = bzrData.sequence;
    
    bzrData.lastNote = bzrData.sequence + BZR_SEQUENCES[song].size / 2 - 2;
    
    bzrData.newSequence = true;
}

/******************************************************************************/

/**
 * @brief BZR_SetFrequency
 *
 * Set the frequency of the timer to play a note
 * Start the timer and OC except if frequency is 0
 *
 * @param   uint16_t frequency  Frequency to play
 * @return  void
 */
static void BZR_SetFrequency(uint16_t frequency)
{
    uint16_t period_tmr; 
    
    PLIB_TMR_Stop(BZR_TMR_ID);
    PLIB_OC_Disable(BZR_OC_ID);
    
    if(frequency != 0)
    {
        period_tmr = (uint16_t)( bzrData.tmrFrequency / frequency);

        PLIB_TMR_Period16BitSet(BZR_TMR_ID, period_tmr);
        PLIB_OC_PulseWidth16BitSet(BZR_OC_ID, period_tmr * BZR_VOLUME);

        PLIB_TMR_Start(BZR_TMR_ID);
        PLIB_OC_Enable(BZR_OC_ID);  
    }
}

/******************************************************************************/

/**
 * @brief BZR_SetCounter
 *
 * Set the duration of the note, using musical tempo
 * (whole, half, quarter, eigth, ...)
 *
 * @param   int8_t tempo  note tempo
 * @return  void
 */
static void BZR_SetCounter(int8_t tempo)
{
    uint32_t counter_ms;
    
    if(tempo > 0)
    {
        counter_ms = (uint32_t)((60000 * 4 / bzrData.tempo) / tempo);
    }
    else if(tempo < 0)
    {
        counter_ms = (uint32_t)((60000 * 4 / bzrData.tempo)/ abs(tempo));
        counter_ms = counter_ms * 1.5;
    }
    else
    {
        counter_ms = 0;
    }
    
    CNT_Set(&bzrData.counterPlay, counter_ms);
    CNT_Reset(&bzrData.counterPlay);
}

/******************************************************************************/

/* End of File ****************************************************************/
