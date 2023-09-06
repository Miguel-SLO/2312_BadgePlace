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
 * File    		: PIC32_Fifo.h
 * Version		: 1.0
 * 
 *******************************************************************************
 *
 * Description 	: Managing a character FIFO using descriptor and pointers
 *  
 *******************************************************************************
 *
 * Author 		: Miguel Santos
 * Date 		: 06.09.2023
 *
 *******************************************************************************
 *
 * MPLAB X 		: 5.45
 * XC32 		: 2.50
 * Harmony 		: 2.06
 *
 ******************************************************************************/

#ifndef PIC32_FIFO_H
#define PIC32_FIFO_H

#include <stdint.h>

/******************************************************************************/

/* FIFO descriptor structure */
typedef struct fifo {
   int32_t size;   	
   int8_t *start;  	
   int8_t *end;  	
   int8_t *write;  
   int8_t *read;
} S_Fifo;

/******************************************************************************/

/**
 * @brief Fifo_Init
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
void Fifo_Init( S_Fifo *fifoDescriptor, int32_t fifoSize,
				int8_t *fifoStart, int8_t initialValue );

/******************************************************************************/

/**
 * @brief Fifo_GetWriteSpace
 *
 * This function calculates the available space for writing
 * in the provided FIFO descriptor,
 * taking into account the current read and write positions.
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @return The available space for writing in the FIFO.
 */
int32_t Fifo_GetWriteSpace( S_Fifo *fifoDescriptor );

/******************************************************************************/

/**
 * @brief Fifo_GetReadSpace
 *
 *
 * This function calculates the available space for reading
 * from the provided FIFO descriptor,
 * taking into account the current read and write positions.
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @return The available space for reading from the FIFO.
 */
int32_t Fifo_GetReadSpace( S_Fifo *fifoDescriptor );

/******************************************************************************/

/**
 * @brief Fifo_Add
 *
 * This function attempts to put the specified character into the FIFO.
 * If the FIFO is full, returns 0 (FIFO FULL),
 * otherwise, it puts the character and returns 1 (OK).
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @param value         The value to add to the FIFO.
 * @return 1 if (OK), 0 if (FIFO FULL).
 */
uint8_t Fifo_Add( S_Fifo *fifoDescriptor , int8_t value );

/******************************************************************************/

/**
 * @brief Fifo_Get
 *
 * This function attempts to get a value from the FIFO.
 * If the FIFO is empty, returns 0 (FIFO EMPTY),
 * otherwise, it gets the value and returns 1 (OK).
 *
 * @param fifoDescriptor Pointer to the FIFO descriptor structure.
 * @param value         Pointer to store the retrieved value.
 * @return 1 if (OK), 0 if (FIFO EMPTY).
 */
uint8_t Fifo_Get( S_Fifo *fifoDescriptor , int8_t *value );

/******************************************************************************/

#endif
