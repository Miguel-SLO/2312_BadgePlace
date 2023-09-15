/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    eth.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "eth.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

ETH_DATA ethData;
static char ethMsgToClient[] = "Hello Client!\n\r";
static uint8_t ethMsgFromClient[80];

static TCPIP_NET_HANDLE    	eth_netH;
static SYS_STATUS          	eth_tcpipStat;
static int                 	eth_nNets;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

/******************************************************************************
  Function:
    static void TCP_Server_TXRX_Task (void)
    
   Remarks:
    Feeds the USB write function. 
*/
static void TCP_Server_TXRX_Task (void)
{
	static IPV4_ADDR    		dwLastIP[2] = { {-1}, {-1} };
	static IPV4_ADDR           	ipAddr;
	int                 		i;

	switch (ethData.txrxTaskState)
	{
        case ETH_TCPIP_WAIT_FOR_IP:
        {
            eth_nNets = TCPIP_STACK_NumberOfNetworksGet();

            for (i = 0; i < eth_nNets; i++)
            {
                eth_netH = TCPIP_STACK_IndexToNet(i);
                ipAddr.Val = TCPIP_STACK_NetAddress(eth_netH);
                if (TCPIP_STACK_NetIsReady(eth_netH))
                {
                    ethData.txrxTaskState = ETH_TCPIP_OPENING_SERVER;
                }
            }
            break;
        }
        case ETH_TCPIP_OPENING_SERVER:
        {
            ethData.socket = TCPIP_TCP_ServerOpen(IP_ADDRESS_TYPE_IPV4, ethData.port, 0);
            if (ethData.socket == INVALID_SOCKET)
            {
                break;
            }
            ethData.txrxTaskState = ETH_TCPIP_WAIT_FOR_CONNECTION;;
        }
        break;

        case ETH_TCPIP_WAIT_FOR_CONNECTION:
        {
            if (!TCPIP_TCP_IsConnected(ethData.socket))
            {
                break;
            }
            else
            {
                // We got a connection
				TCPIP_TCP_ArrayPut(ethData.socket, ethMsgToClient, sizeof(ethMsgToClient));
                ethData.txrxTaskState = ETH_TCPIP_WAIT_FOR_RESPONSE;
            }
        }
        break;

        case ETH_TCPIP_WAIT_FOR_RESPONSE:
        {
            if (!TCPIP_TCP_IsConnected(ethData.socket))
            {
                ethData.txrxTaskState = ETH_TCPIP_WAIT_FOR_IP;
                break;
            }
            if (TCPIP_TCP_GetIsReady(ethData.socket))
            {
                TCPIP_TCP_ArrayGet(ethData.socket, ethMsgFromClient, sizeof(ethMsgFromClient) - 1);
            }
        }
        break;

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void ETH_Initialize ( void )

  Remarks:
    See prototype in eth.h.
 */

void ETH_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    ethData.state = ETH_STATE_INIT;

	ethData.port = 49152;
    
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void ETH_Tasks ( void )

  Remarks:
    See prototype in eth.h.
 */

void ETH_Tasks ( void )
{
    int i;

    /* Check the application's current state. */
    switch ( ethData.state )
    {
        /* Application's initial state. */
        case ETH_STATE_INIT:
        {
            bool appInitialized = true;
       
            eth_tcpipStat = TCPIP_STACK_Status(sysObj.tcpip);
            if(eth_tcpipStat < 0)
            {   // some error occurred
                ethData.state = ETH_STATE_ERROR;
				appInitialized = false;
            }
            else if(eth_tcpipStat == SYS_STATUS_READY)
            {
                // now that the stack is ready we can check the
                // available interfaces
                eth_nNets = TCPIP_STACK_NumberOfNetworksGet();
                for(i = 0; i < eth_nNets; i++)
                {
                    eth_netH = TCPIP_STACK_IndexToNet(i);
                }
                ethData.txrxTaskState = ETH_TCPIP_WAIT_FOR_IP;
            }
        
            if (appInitialized)
            {
            
                ethData.state = ETH_STATE_SERVICE_TASKS;
            }
            break;
        }

        case ETH_STATE_SERVICE_TASKS:
        {
            TCP_Server_TXRX_Task();
        
            break;
        }

        /* TODO: implement your application state machine.*/
        
        case ETH_STATE_ERROR:
        {
			break;
		}

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

 

/*******************************************************************************
 End of File
 */
