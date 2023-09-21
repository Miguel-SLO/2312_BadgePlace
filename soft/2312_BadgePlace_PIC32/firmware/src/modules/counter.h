#ifndef COUNTER_H
#define COUNTER_H

#include <stdint.h>
#include <stdbool.h>

#define TIMER_PERIOD_MS 1

typedef struct{
    uint32_t value;
    uint32_t target;
}S_Counter;

void CNT_Initialize(S_Counter *counter, uint32_t target);

bool CNT_Check( S_Counter *counter );

void CNT_Reset( S_Counter *counter );

void CNT_CallBack( void );

#endif /* COUNTER_H */

/* *****************************************************************************
 End of File
 */
