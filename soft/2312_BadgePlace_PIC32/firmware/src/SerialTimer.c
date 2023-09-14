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
 * File    		: SerialTimer.c
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Emulate a serial port on a GPIO pin using a timer
 *  
 *******************************************************************************
 *
 * Author 		: Miguel Santos
 * Date 		: 14.09.2023
 *
 *******************************************************************************
 *
 * MPLAB X 		: 5.45
 * XC32 		: 2.50
 * Harmony 		: 2.06
 *
 ******************************************************************************/

#include "system_definitions.h"
#include "SerialTimer.h"

/* Pin where the serial datas will be output */
#define SERIAL_PIN LATDbits.LATD0

/* Pin to control the timer related to the serial emulator */
#define SERIAL_TMR T2CONbits.ON

//DRV_TMR_INDEX_0

/* Number of bits to transmit per data */
#define SERIAL_BITS 5

/* Size of the buffer */
#define SERIAL_BUFFER_SIZE 0xFF

/* Default value of the buffer */
#define SERIAL_BUFFER_DEFAULT 0x00

/* Buffer to store datas */
uint8_t SerialBuffer[SERIAL_BUFFER_SIZE];

uint8_t dataWrite = 0;


void SERTIM_Init( void )
{
    uint8_t i_buff = 0;
    
    for(i_buff = 0 ; i_buff < SERIAL_BUFFER_SIZE ; i_buff++)
    {
        SerialBuffer[i_buff] = SERIAL_BUFFER_DEFAULT;
    }
    
    DRV_TMR_Start(DRV_TMR_INDEX_0);
}

void SERTIM_Add(uint8_t *data, uint8_t size)
{
    uint8_t i_data = 0;
    
    for(i_data = 0; i_data < size ; i_data++)
    {
        SerialBuffer[i_data] = *(data + i_data);
    }
}

void SERTIM_Start()
{
    SERIAL_TMR = 1;
}

void SERTIM_CallBack( void )
{
    static uint8_t bitPos = 0;
    static uint8_t dataRead = 0;
    
    LATGbits.LATG9 = 1;

    SERIAL_PIN = (SerialBuffer[dataRead] >> bitPos) & 0x01;
    
    bitPos++;
    
    if(bitPos == SERIAL_BITS)
    {
        bitPos = 0;
        dataRead++;
    }
    
    /* Disable timer when reached end of buffer */
    if(dataRead >= SERIAL_BUFFER_SIZE)
    {
        SERIAL_TMR = 0;
        dataRead = 0;
    }

    LATGbits.LATG9 = 0;
}

/* End of File ****************************************************************/
