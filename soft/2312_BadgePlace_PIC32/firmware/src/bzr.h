#ifndef _BZR_H
#define _BZR_H

#include <stdint.h>
#include <stdbool.h>
#include "system_config.h"
#include "system_definitions.h"

#include "modules/counter.h"

#define BZR_SEQ_MAX_SIZE 1000

typedef enum{
    BZR_SEQ_TEST,
    BZR_SEQ_MARIO,
    BZR_SEQ_IMPERIAL,
    BZR_SEQ_DOOM,
}E_BZR_SEQ;

typedef struct{
    uint16_t tempo;
    uint16_t size;
    int16_t *notes;
}S_BZR_SEQ;

typedef enum{
	BZR_STATE_INIT,
    BZR_STATE_IDLE,
    BZR_STATE_NOTE,
    BZR_STATE_PLAYING,
} BZR_STATES;


typedef struct{
    /* The application's current state */
    BZR_STATES state;
    
    bool newSequence;
    
    uint32_t tmrFrequency;
    
    //uint32_t sizeSequence;
    uint16_t tempo;
    int16_t *currentNote;
    int16_t *lastNote;
    int16_t *sequence;

    S_Counter counterPlay;

} BZR_DATA;

void BZR_Initialize ( void );


void BZR_Tasks( void );

void BZR_SetFrequency(uint16_t frequency);

void BZR_SetCounter(int8_t tempo);

void BZR_PlaySequence(E_BZR_SEQ song);


#endif /* _BZR_H */

/* End of File ****************************************************************/
