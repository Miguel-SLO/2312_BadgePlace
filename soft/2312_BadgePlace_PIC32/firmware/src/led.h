#ifndef _LED_H
#define _LED_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "system_config.h"
#include "system_definitions.h"

typedef enum{
	/* Application's state machine's initial state. */
	LED_STATE_INIT,
    LED_STATE_IDLE,
	LED_STATE_SERVICE_TASKS,
} LED_STATES;

typedef struct
{
    /* The application's current state */
    LED_STATES state;

    /* TODO: Define any additional data used by the application. */

} LED_DATA;

void LED_Initialize ( void );

void LED_Tasks( void );


#endif /* _LED_H */

/*******************************************************************************
 End of File
 */

