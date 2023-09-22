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
#define STR_TMR_ID DRV_TMR_INDEX_1

/* Number of bits to transmit per data */
#define SERIAL_BITS 5

STR_DATA strData;

void STR_Init( void )
{
    uint8_t i_buffer;

    for(i_buffer = 0 ; i_buffer < STR_BUFFER_SIZE ; i_buffer++)
    {
        strData.buffer[i_buffer] = STR_BUFFER_DEFAULT;
    }
    strData.data = strData.buffer;
    strData.bitPos = 0;
}

void STR_AddBuffer(uint8_t *data, uint8_t size)
{
    uint8_t i_data;
    
    for(i_data = 0; i_data < size ; i_data++)
    {
        strData.buffer[i_data] = *(data + i_data);
    }
    
    strData.last = strData.buffer + size - 1;
}

void STR_Start( void )
{
    DRV_TMR_Start(STR_TMR_ID);
}

void STR_CallBack( void )
{    
    SERIAL_PIN = (*strData.data >> strData.bitPos) & 0x01;
    
    strData.bitPos++;
    
    /* Go back to lsb when reached limit */
    if(strData.bitPos >= SERIAL_BITS)
    {
        strData.bitPos = 0;
        strData.data++;
    }
    
    /* Disable timer when reached end of buffer */
    if(strData.data > strData.last)
    {
        DRV_TMR_Stop(STR_TMR_ID);
        strData.data = strData.buffer;
    }
}

/* End of File ****************************************************************/
