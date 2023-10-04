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
 * File    		: esp.h
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing ESP32 state machine and commands
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

#ifndef _ESP_H
#define _ESP_H

/******************************************************************************/

#include <stdint.h>
#include <stdbool.h>
#include "system_config.h"
#include "system_definitions.h"
#include "modules/fifo.h"
#include "modules/counter.h"

/******************************************************************************/

/* Buffers sizes */

#define ESP_FIFO_SIZE 250

#define AT_CMD_SIZE 60
#define AT_ACK_SIZE 6
#define AT_DATA_COUNT 4
#define AT_DATA_SIZE 50

/******************************************************************************/

/* AT commands to send */
#define AT_CMD_AT       "AT"
#define AT_CMD_RST      "AT+RST"
#define AT_CMD_CWMODEIS "AT+CWMODE=1"
#define AT_CMD_CWMODE   "AT+CWMODE?"
#define AT_CMD_CWJAP    "AT+CWJAP=\"kpp-55143\",\"Jvey-mjD9-V3g4-WNvt\""
//#define AT_CMD_CIPSTART "AT+CIPSTART=\"TCP\",\"badgeplace\",8080"
#define AT_CMD_CIPSTART "AT+CIPSTART=\"TCP\",\"DESKTOP-PHANTEK-1\",8080"
#define AT_CMD_CIPSEND  "AT+CIPSEND=4"

/* AT acknowledge responses */
#define AT_ACK_OK       "OK"
#define AT_ACK_ERROR    "ERROR"

/******************************************************************************/

/* Structure of packets communication as defined by ESP32 datasheet */
typedef struct
{
    char command[AT_CMD_SIZE];    
    char ack[AT_ACK_SIZE];
    char data[AT_DATA_COUNT][AT_DATA_SIZE];
    
} S_AT_PACKET;

/******************************************************************************/

/* ESP state machine */
typedef enum
{            
    /* Waiting for a command */
    ESP_STATE_IDLE,
            
    /* Transmitting a command */
    ESP_STATE_TRANSMIT,
            
    /* Receiving a command */
    ESP_STATE_RECEIVE,
            
    /* Translating the UART message */
    ESP_STATE_TRANSLATE,
            
    /* Waiting for main application */
    ESP_STATE_WAIT,
            
} E_ESP_STATES;

/******************************************************************************/

/* ESP32 structure of global data */
typedef struct
{
    /* Application's current states */
    E_ESP_STATES state;
    
    /* Applications's flags */
    bool transmit;
    bool receive;
    bool translate;
    bool wait;
    bool newMessage;
    
    /* Applications COUNTERS */
    S_Counter cntReceive;
    S_Counter cntWait;

    /* Application's FIFOS descriptors */
    S_Fifo fifoDesc_tx;
    S_Fifo fifoDesc_rx; 

    /* Application's FIFOS buffers */
    uint8_t fifoBuff_tx[ESP_FIFO_SIZE];
    uint8_t fifoBuff_rx[ESP_FIFO_SIZE];
    
    /* Buffer to store response commands */
    char resBuffer[ESP_FIFO_SIZE];
    
    /* Pointer to last char received */
    char *p_resBuffer;
    
    /* Store response as different fields */
    S_AT_PACKET atResponse;
    
} ESP_DATA;

/******************************************************************************/

/**
 * @brief ESP_Initialize
 *
 * Initialize ESP32 state machine, counters and FIFOs
 *
 * @param  void
 * @return void
 */
void ESP_Initialize ( void );

/******************************************************************************/

/**
 * @brief ESP_Tasks
 *
 * Execute ESP32 state machine, should be called cyclically
 *
 * @param  void
 * @return void
 */
void ESP_Tasks( void );

/******************************************************************************/

/**
 * @brief ESP_SendCommand
 *
 * Send a command to the ESP32, managed by state machine
 *
 * @param  char Command to send ; Use constant definitions 
 * @return bool True = command send ; False = Not allowed to send a command
 */
bool ESP_SendCommand( char *command );

bool ESP_SendData( uint8_t *data, uint8_t size );

bool ESP_WIFI_Confirmed( void );

bool ESP_TCP_Connected( void );

bool ESP_Acknowledged( void );

void ESP_Reset_Acknowledge( void );

/******************************************************************************/

#endif /* _ESP_H */

/* End of File ****************************************************************/
