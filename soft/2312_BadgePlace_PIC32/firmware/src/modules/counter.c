#include "counter.h"

uint32_t SYS_counter = 0;

void CNT_Initialize(S_Counter *counter, uint32_t target)
{
    counter->value = SYS_counter;
    counter->target = target;
}

bool CNT_Check( S_Counter *counter )
{
    bool checkStatus;

    checkStatus = ((SYS_counter - counter->value) >= counter->target);
    
    return checkStatus;
}

void CNT_Reset( S_Counter *counter )
{
    counter->value = SYS_counter;
}

void CNT_CallBack( void )
{    
    SYS_counter++;
}

/* *****************************************************************************
 End of File
 */
