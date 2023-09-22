#ifndef _BZR_H
#define _BZR_H

#include <stdbool.h>

#define BZR_SEQ_MAX_SIZE 1000

typedef struct{
    uint32_t sizeSequence;
    uint32_t currentNote;
    uint16_t *sequence;
}S_BZR_SEQ;

typedef enum{
    BZR_SEQ_MARIO = 0x04,
}E_BZR_SEQ;

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

} BZR_DATA;

void BZR_Initialize ( void );


void BZR_Tasks( void );

bool BZR_PlaySequence(E_BZR_SEQ song);


#endif /* _BZR_H */

/* End of File ****************************************************************/
