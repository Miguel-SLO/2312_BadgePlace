#ifndef _ESP_H
#define _ESP_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include <xc.h>
#include <sys/attribs.h>
#include "system_config.h"
#include "system_definitions.h"
#include "modules/fifo.h"

#define ESP_FIFO_SIZE 50

#define AT_COMMAND_OK "OK"
#define AT_COMMAND_RESTART "AT+RST"

/* Application's state machine */
typedef enum
{
	ESP_STATE_INIT = 0x00,
    ESP_STATE_IDLE,
    ESP_STATE_TRANSMIT,
    ESP_STATE_RECEIVE,
} ESP_STATES;

typedef enum
{
    ESP_AT_OK = 0x00,
    ESP_AT_STARTUP,
    ESP_AT_RESTART,
    ESP_AT_CHECK,
}ESP_AT;

typedef struct
{
    /* Application's current state */
    ESP_STATES state;
    
    /* Applications's flags */
    bool transmit;
    bool receive;    

    /* Fifo descriptors */
    S_Fifo fifoDescr_tx;
    S_Fifo fifoDescr_rx; 

    /* Fifo data buffers */
    uint8_t fifo_tx[ESP_FIFO_SIZE];
    uint8_t fifo_rx[ESP_FIFO_SIZE];
    

} ESP_DATA;


void ESP_Initialize ( void );

void ESP_Tasks( void );

void ESP_SendCommand(const char* command);

#endif /* _ESP_H */

/*******************************************************************************
 End of File
 */
