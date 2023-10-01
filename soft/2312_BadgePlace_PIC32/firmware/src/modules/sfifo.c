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
 * File    		: sfifo.c
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing a string FIFO using descriptor and pointers
 *                Maximal size of FIFO is 255
 *  
 *******************************************************************************
 *
 * Author 		: Miguel Santos
 * Date 		: 01.10.2023
 *
 *******************************************************************************
 *
 * MPLAB X 		: 5.45
 * XC32 		: 2.50
 * Harmony 		: 2.06
 *
 ******************************************************************************/

#include <string.h>

#include "sfifo.h"

/******************************************************************************/

/**
 * @brief SFIFO_Init
 *
 * This function initializes a FIFO with the provided parameters,
 * setting its size, start address, and initializing all elements
 * to the given initial value.
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @param fifoSize      The size of the FIFO.
 * @param fifoStart     Pointer to the beginning of the FIFO memory.
 * @param initialValue  The initial value to set for all elements in the FIFO.
 * @return void
 */
void SFIFO_Initialize( S_Sfifo *fifoDescriptor, char *fifoStart[],
                        uint8_t fifoSize, char *initialValue )
{
	/* Local variables declaration */
    uint8_t i;
	
	/* Fifo descriptor values initialisation */
    fifoDescriptor->start   = fifoStart;
	fifoDescriptor->size 	= fifoSize;
	fifoDescriptor->write 	= 0;
	fifoDescriptor->read 	= 0;
	
	/* Loop through entire fifo to set initial value */
	for( i = 0 ; i < fifoSize ; i++)
	{
		fifoDescriptor->start[i] = *initialValue;
	}
}

/******************************************************************************/

/**
 * @brief SFIFO_GetWriteSpace
 *
 * This function calculates the available space for writing
 * in the provided FIFO descriptor,
 * taking into account the current read and write positions.
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @return The available space for writing in the FIFO.
 */
uint8_t SFIFO_GetWriteSpace( S_Sfifo *fifoDescriptor )
{
	return (fifoDescriptor->size - fifoDescriptor->elements);
}

/******************************************************************************/

/**
 * @brief SFIFO_GetReadSpace
 *
 *
 * This function calculates the available space for reading
 * from the provided FIFO descriptor,
 * taking into account the current read and write positions.
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @return The available space for reading from the FIFO.
 */
uint8_t SFIFO_GetReadSpace( S_Sfifo *fifoDescriptor )
{
	return (fifoDescriptor->elements);
}

/******************************************************************************/

/**
 * @brief SFIFO_Add
 *
 * This function attempts to put the specified character into the FIFO.
 * If the FIFO is full, returns 0 (FIFO FULL),
 * otherwise, it puts the character and returns 1 (OK).
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @param value         The value to add to the FIFO.
 * @return true if (OK), false if (FIFO FULL).
 */
bool SFIFO_AddString( S_Sfifo *fifoDescriptor , char *string )
{
    /* Local variables declaration */
    bool writeStatus;

    /* True = space available ; False = FIFO full */
    writeStatus = SFIFO_GetWriteSpace(fifoDescriptor);

    if (writeStatus)
    {
        strcpy(&fifoDescriptor->start[fifoDescriptor->write], string);

        /* Increment the write pointer */
        fifoDescriptor->write++;
        
        /* Increment number of elements */
        fifoDescriptor->elements++;

        /* Handle wrap-around */
        if (fifoDescriptor->write >= fifoDescriptor->size)
        {
            fifoDescriptor->write = 0;
        }        
    }

    /* Return status */
    return writeStatus;
}

/******************************************************************************/

/**
 * @brief SFIFO_GetData
 *
 * This function attempts to get a value from the FIFO.
 * If the FIFO is empty, returns 0 (FIFO EMPTY),
 * otherwise, it gets the value and returns 1 (OK).
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @param value         Pointer to store the retrieved value.
 * @return true if (OK), false if (FIFO EMPTY).
 */
bool SFIFO_GetString( S_Sfifo *fifoDescriptor , char *string )
{
    /* Local variables declaration */
    bool readStatus;
    
    /* True = values in FIFO ; False = FIFO empty */
    readStatus = SFIFO_GetReadSpace(fifoDescriptor);
        
    if (readStatus)
    {
        /* Read value in FIFO */
        strcpy(string, &fifoDescriptor->start[fifoDescriptor->read]);

        /* Increment read pointer */
        fifoDescriptor->read++;
        
        /* Decrement number of elements */
        fifoDescriptor->elements--;

        /* Handle wrap-around */
        if (fifoDescriptor->read >= fifoDescriptor->size)
        {
            fifoDescriptor->read = 0;
        }
    }
    else
    {
        /* Value read = NULL */
        string = "";
    }

    /* Return status */
    return readStatus;
}

/******************************************************************************/

/* End of File ****************************************************************/
