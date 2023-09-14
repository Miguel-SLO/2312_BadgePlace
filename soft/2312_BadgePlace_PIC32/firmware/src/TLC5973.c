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
 * File    		: TLC5973.c
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Interface and data conversion for TLC5973
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

#include "TLC5973.h"
#include "SerialTimer.h"

#define TLC_BUFFER_SIZE 0xFF
#define CIRCUIT_IN_SERIE 3
#define DWS_CYCLES 48
#define EOS_CYCLES 4
#define GSL_CYCLES 10
#define DWS_OFFSET (DWS_CYCLES + EOS_CYCLES)
#define COMMAND_WRITE 0x3AA
#define CYCLE_HIGH 0x05
#define CYCLE_LOW 0x01
#define CYCLE_SKIP 0x00


typedef union
{
    uint16_t dataBytes[4];
    struct{
        uint16_t COMMAND;
        uint16_t OUT0;
        uint16_t OUT1;
        uint16_t OUT2;        
    };    
}TLC_PACKET;

TLC_PACKET Chips[CIRCUIT_IN_SERIE];
uint8_t TLC_Buffer[TLC_BUFFER_SIZE];
uint8_t TLC_Flag;

void TLC_Init( void )
{
    uint8_t i_data = 0;
    
    for(i_data = 0; i_data < TLC_BUFFER_SIZE; i_data++ )
    {
        TLC_Buffer[i_data] = CYCLE_SKIP;
    }
    
    for(i_data = 0; i_data < CIRCUIT_IN_SERIE; i_data++ )
    {
        Chips[i_data].COMMAND = COMMAND_WRITE;
        Chips[i_data].OUT0 = 0x00;
        Chips[i_data].OUT1 = 0x00;
        Chips[i_data].OUT2 = 0x00;        
    }
    
    TLC_Flag = 1;
}

void TLC_Convert(uint8_t IC_ID)
{
    uint8_t i_data = 0;
    uint8_t i_bits = 0;
    uint8_t i_cycl = DWS_OFFSET * IC_ID;
    
    for(i_data = 0; i_data < 4 ; i_data++)
    {
        for(i_bits = 0 ; i_bits < 12 ; i_bits++)
        {
            if(Chips[IC_ID].dataBytes[i_data] & (0x800 >> i_bits))
            {
                TLC_Buffer[i_cycl] = CYCLE_HIGH;
            }
            else
            {
                TLC_Buffer[i_cycl] = CYCLE_LOW;
            }
            
            i_cycl++;
        }
    }
}

void TLC_Transfer( void )
{
    SERTIM_Add(TLC_Buffer, TLC_BUFFER_SIZE);
}

void TLC_Set(uint8_t IC_ID, uint16_t OUT0, uint16_t OUT1, uint16_t OUT2)
{
    Chips[IC_ID].OUT0 = OUT0;
    Chips[IC_ID].OUT1 = OUT1;
    Chips[IC_ID].OUT2 = OUT2;
    
    TLC_Convert(IC_ID);
    TLC_Transfer();
    
    SERTIM_Start();
}

/* *****************************************************************************
 End of File
 */
