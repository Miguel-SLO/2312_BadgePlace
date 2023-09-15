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

/******************************************************************************/

/******************************************************************************/

#include "TLC5973.h"
#include "SerialTimer.h"

/******************************************************************************/

/******************************************************************************/

/* Number of drivers connected in series */
#define DRIVER_COUNT 3

/******************************************************************************/

/* Data Write Sequence cycles count */
#define DWS_CYCLE_COUNT 48
#define DWS_TOTAL_COUNT (DWS_CYCLE_COUNT * DRIVER_COUNT)

/* End Of Sequence cycles count */
#define EOS_CYCLE_COUNT 4
#define EOS_TOTAL_COUNT (EOS_CYCLE_COUNT * (DRIVER_COUNT - 1))

/* GrayScale Latch cycles count */
#define GSL_CYCLE_COUNT 10
#define GSL_TOTAL_COUNT GSL_CYCLE_COUNT

/* Size of the buffer to store cycles */
#define TLC_BUFFER_SIZE (DWS_TOTAL_COUNT + EOS_TOTAL_COUNT + GSL_TOTAL_COUNT)

/* Buffer offset for each driver */
#define DWS_OFFSET (DWS_CYCLE_COUNT + EOS_CYCLE_COUNT)

/* Each packet starts with a write command */
#define WRITE_COMMAND 0x3AA

/* High state cycle encoding */
#define CYCLE_CODE_HIGH 0x05

/* Low state cycle encoding */
#define CYCLE_CODE_LOW  0x01

/* Skip state cycle encoding */
#define CYCLE_CODE_SKIP 0x00

/* Number of fields per packet */
#define FIELD_COUNT 4

/* Number of cycles per field */
#define FIELD_CYCLE 12

/* Mask to single bit in field */
#define FIELD_MASK 0x800

/******************************************************************************/
/******************************************************************************/

/* Union for storing TLC5973 packet data */
typedef union
{
    /* Store packet data as an array of 16-bit words */
    uint16_t words[FIELD_COUNT];

    /* Structure to access individual fields of the packet */
    struct
    {
        /* Command word within the packet */
        uint16_t COMMAND:FIELD_CYCLE;

        /* Output value for channel 0 */
        uint16_t OUT0   :FIELD_CYCLE;

        /* Output value for channel 1 */
        uint16_t OUT1   :FIELD_CYCLE;

        /* Output value for channel 2 */
        uint16_t OUT2   :FIELD_CYCLE;
    };
} TLC_PACKET;

typedef struct
{
    TLC_PACKET packet;
    uint8_t flagNew;
}TLC_DRIVER;

typedef enum
{
    TLC_STATE_INIT,
    TLC_STATE_WAIT,
    TLC_STATE_CONVERT,
    TLC_STATE_TRANSFER,
} TLC_STATES;

typedef struct
{
    /* TLC5973 state machine */
    TLC_STATES state;
    
    /* Flag variable for TLC5973 operations */
    uint8_t flagUpdate;
    
    /* TLC5973 cycles buffer */
    uint8_t cycles[TLC_BUFFER_SIZE];
    
    /* TLC5973 drivers data array */
    TLC_DRIVER drivers[DRIVER_COUNT];
    
}TLC_DATA;

TLC_DATA TLC_Data;

/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/* Initialize TLC5940 */
/******************************************************************************/
void TLC_Init( void )
{
    uint8_t I_Init = 0;
    
    /* Initialize TLC_Buffer with CYCLE_SKIP */
    for(I_Init = 0; I_Init < TLC_BUFFER_SIZE; I_Init++ )
    {
        TLC_Data.cycles[I_Init] = CYCLE_CODE_SKIP;
    }
    
    /* Initialize TLC_Drivers with default values */
    for(I_Init = 0; I_Init < DRIVER_COUNT; I_Init++ )
    {
        TLC_Data.drivers[I_Init].packet.COMMAND = WRITE_COMMAND;
        TLC_Data.drivers[I_Init].packet.OUT0 = 0x00;
        TLC_Data.drivers[I_Init].packet.OUT1 = 0x00;
        TLC_Data.drivers[I_Init].packet.OUT2 = 0x00;        
    }
    
    /* Set TLC_UpdateFlag to indicate data has been initialized */
    TLC_Data.flagUpdate = 1;
}
/******************************************************************************/

/******************************************************************************/
void TLC_Convert(uint8_t DriverID)
{
    uint16_t T_word;
    
    uint8_t I_field;
    uint8_t I_bits;
    uint8_t I_cycle;
    
    I_cycle = DWS_OFFSET * DriverID;
    
    for(I_field = 0; I_field < FIELD_COUNT ; I_field++)
    {
        T_word = TLC_Data.drivers[I_field].packet.words[I_field];
        for(I_bits = 0 ; I_bits < FIELD_CYCLE ; I_bits++)
        {
            if( T_word & (FIELD_MASK >> I_bits))
            {
                TLC_Data.cycles[I_cycle] = CYCLE_CODE_HIGH;
            }
            else
            {
                TLC_Data.cycles[I_cycle] = CYCLE_CODE_LOW;
            }
            
            I_cycle++;
        }
    }
}

void TLC_Transfer( void )
{
    STR_Add(TLC_Data.cycles, TLC_BUFFER_SIZE);
}

void TLC_Set(uint8_t DriverID, uint16_t OUT0, uint16_t OUT1, uint16_t OUT2)
{
    TLC_Data.drivers[DriverID].packet.OUT0 = OUT0;
    TLC_Data.drivers[DriverID].packet.OUT1 = OUT1;
    TLC_Data.drivers[DriverID].packet.OUT2 = OUT2;
    
    TLC_Convert(DriverID);
    TLC_Transfer();
    
    STR_Start();
}

/* *****************************************************************************
 End of File
 */
