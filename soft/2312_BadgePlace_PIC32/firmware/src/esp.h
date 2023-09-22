#ifndef _ESP_H
#define _ESP_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include "system_config.h"
#include "system_definitions.h"
#include "modules/fifo.h"
#include "modules/counter.h"

#define ESP_FIFO_SIZE 50

#define AT_CMD_AT "AT"
#define AT_CMD_SIZE 20
#define AT_DATA_SIZE 50
#define AT_ACK_SIZE 10

#ifndef TIMER_PERIOD_MS
    #define TIMER_PERIOD_MS 1
#endif


typedef struct{
    char command[AT_CMD_SIZE];
    char data[AT_DATA_SIZE];
    char ack[AT_ACK_SIZE];
} S_AT_PACKET;

/* Application's state machine */
typedef enum{
	ESP_STATE_INIT = 0x00,
    ESP_STATE_IDLE,
    ESP_STATE_TRANSMIT,
    ESP_STATE_RECEIVE,
    ESP_STATE_TRANSLATE,
    ESP_STATE_WAIT,
} E_ESP_STATES;

/* Application's data */
typedef struct{
    /* Application's current states */
    E_ESP_STATES state;
    
    S_AT_PACKET atResponse;
    
    /* Buffer to store response commands */
    char resBuffer[ESP_FIFO_SIZE];
    
    /* Pointer to last char received */
    char *p_resBuffer;
    
    /* Applications's flags */
    bool transmit;
    bool receive;
    bool translate;
    bool wait;
    
    /* Applications COUNTERS */
    S_Counter cntReceive;
    S_Counter cntWait;

    /* Application's FIFOS descriptors */
    S_Fifo fifoDesc_tx;
    S_Fifo fifoDesc_rx; 

    /* Application's FIFOS buffers */
    uint8_t fifoBuff_tx[ESP_FIFO_SIZE];
    uint8_t fifoBuff_rx[ESP_FIFO_SIZE];
} ESP_DATA;



void ESP_Initialize ( void );

void ESP_Tasks( void );

bool ESP_SendCommand( char *command );

//static bool ESP_GetResponse( void );

//static bool ESP_Translate( void )

#endif /* _ESP_H */

/*******************************************************************************
 End of File
 */
