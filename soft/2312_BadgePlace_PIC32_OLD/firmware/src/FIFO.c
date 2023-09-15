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
 * File    		: FIFO.c
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing a FIFO using descriptor and pointers
 *                Maximal size of FIFO is 255
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

#include "FIFO.h"

/******************************************************************************/

/**
 * @brief FIFO_Init
 *
 * This function initializes a FIFO with the provided parameters,
 * setting its size, start address, and initializing all elements
 * to the given initial value.
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @param fifoSize      The size of the FIFO.
 * @param fifoStart     Pointer to the beginning of the FIFO memory.
 * @param initialValue  The initial value to set for all elements in the FIFO.
 */
void FIFO_Init( S_Fifo *fifoDescriptor, uint8_t fifoSize,
				uint8_t *fifoStart, uint8_t initialValue )
{
	/* Local variables declaration */
	uint8_t i;
	uint8_t *fifoPosition;
	
	/* Fifo descriptor values initialisation */
	fifoDescriptor->size 	= fifoSize;
	fifoDescriptor->start 	= fifoStart;
	fifoDescriptor->end 	= fifoStart + (fifoSize - 1);
	fifoDescriptor->write 	= fifoStart;
	fifoDescriptor->read 	= fifoStart;
	
	fifoPosition = fifoStart;
	
	/* Loop through entire fifo to set initial value */
	for( i = 0 ; i < fifoSize ; i++)
	{
		*fifoPosition = initialValue;
		fifoPosition++;
	}
}

/******************************************************************************/

/**
 * @brief FIFO_GetWriteSpace
 *
 * This function calculates the available space for writing
 * in the provided FIFO descriptor,
 * taking into account the current read and write positions.
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @return The available space for writing in the FIFO.
 */
uint8_t FIFO_GetWriteSpace( S_Fifo *fifoDescriptor )
{
	/* Local variables declaration */
	int8_t writeSpace;

	/* Calculate space available */
	writeSpace = fifoDescriptor->read - fifoDescriptor->write - 1;
   
	/* Adjust to positive if needed */
	if (writeSpace < 0)
	{
		writeSpace = writeSpace + fifoDescriptor->size;
    }
	
	/* Return value */
	return (uint8_t)writeSpace;
}

/******************************************************************************/

/**
 * @brief FIFO_GetReadSpace
 *
 *
 * This function calculates the available space for reading
 * from the provided FIFO descriptor,
 * taking into account the current read and write positions.
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @return The available space for reading from the FIFO.
 */
uint8_t FIFO_GetReadSpace( S_Fifo *fifoDescriptor )
{
	/* Local variables declaration */
	int8_t readSpace;
	
	/* Calculate space available */
	readSpace = fifoDescriptor->write - fifoDescriptor->read;
   
	/* Adjust to positive if needed */
	if (readSpace < 0)
	{
		readSpace = readSpace +  fifoDescriptor->size;
	}
	
	/* Return value */
	return (uint8_t)readSpace;
}

/******************************************************************************/

/**
 * @brief FIFO_Add
 *
 * This function attempts to put the specified character into the FIFO.
 * If the FIFO is full, returns 0 (FIFO FULL),
 * otherwise, it puts the character and returns 1 (OK).
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @param value         The value to add to the FIFO.
 * @return 1 if (OK), 0 if (FIFO FULL).
 */
uint8_t FIFO_Add( S_Fifo *fifoDescriptor , uint8_t value )
{
    /* Local variables declaration */
    uint8_t writeStatus;

    /* True = space available ; False = FIFO full */
    writeStatus = FIFO_GetWriteSpace(fifoDescriptor);

    if (writeStatus)
    {
        /* Write the value into the FIFO */
        *(fifoDescriptor->write) = value;

        /* Increment the write pointer */
        fifoDescriptor->write++;

        /* Handle wrap-around */
        if (fifoDescriptor->write > fifoDescriptor->end)
        {
            fifoDescriptor->write = fifoDescriptor->start;
        }
    }

    /* Return status */
    return writeStatus;
}

/******************************************************************************/

/**
 * @brief FIFO_Get
 *
 * This function attempts to get a value from the FIFO.
 * If the FIFO is empty, returns 0 (FIFO EMPTY),
 * otherwise, it gets the value and returns 1 (OK).
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @param value         Pointer to store the retrieved value.
 * @return 1 if (OK), 0 if (FIFO EMPTY).
 */
uint8_t FIFO_Get( S_Fifo *fifoDescriptor , uint8_t *value )
{
    /* Local variables declaration */
    uint8_t readStatus;
    
    /* True = values in FIFO ; False = FIFO empty */
    readStatus = FIFO_GetReadSpace(fifoDescriptor);
        
    if (readStatus)
    {
        /* Read value in FIFO */
        *value = *(fifoDescriptor->read);

        /* Increment read pointer */
        fifoDescriptor->read++;

        /* Handle wrap-around */
        if (fifoDescriptor->read > fifoDescriptor->end)
        {
            fifoDescriptor->read = fifoDescriptor->start;
        }
    }
    else
    {
        /* Value read = NULL */
        *value = 0;
    }

    /* Return status */
    return readStatus;
}

/******************************************************************************/

/* End of File ****************************************************************/
