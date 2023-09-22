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

#define CHANNEL_COUNT 3

/* Single field cycles count */
#define FLD_CYCLE_COUNT 12

#define DWS_CYCLE_COUNT 48
#define DWS_TOTAL_COUNT (DWS_CYCLE_COUNT * DRIVER_COUNT)

/* End Of Sequence cycles count */
#define EOS_CYCLE_COUNT 4
#define EOS_TOTAL_COUNT (EOS_CYCLE_COUNT * (DRIVER_COUNT - 1))

/* GrayScale Latch cycles count */
#define GSL_CYCLE_COUNT 10

/* Size of the buffer to store cycles */
#define TLC_BUFFER_SIZE (DWS_TOTAL_COUNT + EOS_TOTAL_COUNT + GSL_CYCLE_COUNT)

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

/* Mask to single bit in field */
#define FIELD_MASK 0x800

/******************************************************************************/
/******************************************************************************/

typedef struct{
    /* Output value for channel */
    uint16_t out;
    /* Pointers where values will be stored in CYCLE buffer */
    uint8_t *p_out;
    /* New value in channel */
    bool newValue;
}S_TLC_CHANNEL;

typedef struct{
    S_TLC_CHANNEL channel[CHANNEL_COUNT];
    bool newValue;
}S_TLC_DRIVER;

S_TLC_CHANNEL tlcCommands[DRIVER_COUNT];
S_TLC_DRIVER tlcDrivers[DRIVER_COUNT];

uint8_t cyclesBuffer[TLC_BUFFER_SIZE];

/******************************************************************************/
/******************************************************************************/

static bool TLC_SetChannel(S_TLC_CHANNEL *channel, uint16_t value);
static bool TLC_TranslateChannel(S_TLC_CHANNEL *channel);
static bool TLC_TranslateDriver(S_TLC_DRIVER *driver);
static bool TLC_TranslateAll( void );

/******************************************************************************/
/* Initialize TLC5940 */
/******************************************************************************/
void TLC_Initialize( void )
{
    uint8_t i_buff;
    uint8_t i_drv;
    uint8_t i_cha;
    
    /* Initialize TLC_Buffer with CYCLE_SKIP */
    for(i_buff = 0; i_buff < TLC_BUFFER_SIZE; i_buff++ )
    {
        cyclesBuffer[i_buff] = CYCLE_CODE_SKIP;
    }
    
    /* Initialize TLC_Drivers with default values */
    for(i_drv = 0; i_drv < DRIVER_COUNT; i_drv++ )
    {
        /* Commands are static channels in buffer */
        tlcCommands[i_drv].out = WRITE_COMMAND;
        tlcCommands[i_drv].p_out = cyclesBuffer + 
                                   (DWS_OFFSET * i_drv);
        tlcCommands[i_drv].newValue = true;        
        TLC_TranslateChannel(&tlcCommands[i_drv]);
        
        for(i_cha = 0; i_cha < CHANNEL_COUNT; i_cha++)
        {
            tlcDrivers[i_drv].channel[i_cha].out = 0x00;
            tlcDrivers[i_drv].channel[i_cha].newValue = true;
            tlcDrivers[i_drv].channel[i_cha].p_out = cyclesBuffer + 
                                                (DWS_OFFSET * i_drv) + 
                                                (FLD_CYCLE_COUNT * (i_cha + 1));
        }
        tlcDrivers[i_drv].newValue = true;
    }
    
    TLC_TranslateAll();
    
    /* Initialize the serial timer */
    STR_Init();
}
/******************************************************************************/

bool TLC_Transmit( void )
{
    bool status;
    
    status = TLC_TranslateAll();
    
    if(status)
    {
        STR_AddBuffer(cyclesBuffer, TLC_BUFFER_SIZE);
        STR_Start();
    }

    return status;
}

bool TLC_SetAll(uint16_t out0, uint16_t out1, uint16_t out2)
{
    bool status;
    uint8_t i_drv;
    
    status = false;
    
    for(i_drv = 0; i_drv < DRIVER_COUNT; i_drv++)
    {
        status &= TLC_SetDriver(i_drv, out0, out1, out2);
    }
    
    return status;
}

bool TLC_SetDriver(E_TLC_DRV_ID driver, uint16_t out0, uint16_t out1, uint16_t out2)
{
    bool status;
    
    status = false;
    
    if(driver < DRIVER_COUNT)
    {
        /* Set channel 0 */
        status |= TLC_SetChannel(&tlcDrivers[driver].channel[0], out0);
        /* Set channel 1 */
        status |= TLC_SetChannel(&tlcDrivers[driver].channel[1], out1);
        /* Set channel 2 */
        status |= TLC_SetChannel(&tlcDrivers[driver].channel[2], out2);
        
        tlcDrivers[driver].newValue = status;
    }
    
    return status;
}

static bool TLC_SetChannel(S_TLC_CHANNEL *channel, uint16_t value)
{
    bool status;
    
    status = false;
    
    if(channel->out != value)
    {
        channel->out = value;
        channel->newValue = true;
        
        status = true;
    }
    
    return status;
}

static bool TLC_TranslateAll( void )
{
    bool status;
    uint8_t i_drv;
    
    status = false;
    
    for(i_drv = 0; i_drv < DRIVER_COUNT; i_drv++)
    {
        if(tlcDrivers[i_drv].newValue)
        {
            status |= TLC_TranslateDriver(&tlcDrivers[i_drv]);
            tlcDrivers[i_drv].newValue = false;
        }
    }
    
    return status;
}

static bool TLC_TranslateDriver(S_TLC_DRIVER *driver)
{
    bool status;
    uint8_t i_cha;
    
    status = true;
    
    for(i_cha = 0; i_cha < CHANNEL_COUNT; i_cha++)
    {
        if(driver->channel[i_cha].newValue)
        {
            status &= TLC_TranslateChannel(&driver->channel[i_cha]);
            driver->channel[i_cha].newValue = false;
            driver->newValue = true;
        }
    }
    
    return status;
}

static bool TLC_TranslateChannel(S_TLC_CHANNEL *channel)
{
    bool status;
    uint8_t i_bits;
    
    status = false;
    
    /* Watchdog */
    if(channel->p_out != NULL)
    {
        for(i_bits = 0 ; i_bits < FLD_CYCLE_COUNT ; i_bits++)
        {
            if( channel->out & (FIELD_MASK >> i_bits) )
            {
                channel->p_out[i_bits] = CYCLE_CODE_HIGH;
            }
            else
            {
                channel->p_out[i_bits] = CYCLE_CODE_LOW;
            }
        }
        status = true;
    }
    
    return status;
}

/* *****************************************************************************
 End of File
 */
