/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    phy.c

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

#include "phy.h"

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

PHY_DATA phyData;
static char phyServerIP[] = "192.168.100.101";
static char phyMsg[] = "Hello Server!";

static SYS_STATUS          	phy_tcpipStat;
static TCPIP_NET_HANDLE    	phy_netH;
static int                 	phy_nNets;

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
    static void TCP_Client_TX_Task (void)
    
   Remarks:
    Feeds the USB write function. 
*/
static void TCP_Client_TX_Task (void)
{
	static IPV4_ADDR ipAddr;
	int i;

	switch (phyData.txTaskState)
	{
        case PHY_TCPIP_WAIT_FOR_IP:
        {
            phy_nNets = TCPIP_STACK_NumberOfNetworksGet();

            for (i = 0; i < phy_nNets; i++)
            {
                phy_netH = TCPIP_STACK_IndexToNet(i);
                ipAddr.Val = TCPIP_STACK_NetAddress(phy_netH);
                if(TCPIP_STACK_NetIsReady(phy_netH))
                {
                    phyData.txTaskState = PHY_TCPIP_WAITING_FOR_COMMAND;
                }
            }
            break;
        }
        case PHY_TCPIP_WAITING_FOR_COMMAND:
        {
            IPV4_ADDR addr;
            
            TCPIP_Helper_StringToIPAddress(phyServerIP, &addr);
            phyData.socket = TCPIP_TCP_ClientOpen(IP_ADDRESS_TYPE_IPV4,phyData.port,
                                                    (IP_MULTI_ADDRESS*) &addr);
            
            if (phyData.socket == INVALID_SOCKET)
            {
                phyData.txTaskState = PHY_TCPIP_WAITING_FOR_COMMAND;
            }

            phyData.txTaskState = PHY_TCPIP_WAIT_FOR_CONNECTION;
            break;
        }
        break;

        case PHY_TCPIP_WAIT_FOR_CONNECTION:
        {
            char buffer[256];
            if (!TCPIP_TCP_IsConnected(phyData.socket))
            {
                break;
            }
            if(TCPIP_TCP_PutIsReady(phyData.socket) == 0)
            {
                break;
            }

            sprintf(buffer, "Message: %s\r\n", phyMsg);
            TCPIP_TCP_ArrayPut(phyData.socket, (uint8_t*)buffer, strlen(buffer));
            phyData.txTaskState = PHY_TCPIP_TX_DONE;
        }
        break;

        case PHY_TCPIP_TX_DONE:
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

/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void PHY_Initialize ( void )

  Remarks:
    See prototype in phy.h.
 */

void PHY_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    phyData.state = PHY_STATE_INIT;

	phyData.port = 49152;
    
    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void PHY_Tasks ( void )

  Remarks:
    See prototype in phy.h.
 */

void PHY_Tasks ( void )
{
    int i;

    /* Check the application's current state. */
    switch ( phyData.state )
    {
        /* Application's initial state. */
        case PHY_STATE_INIT:
        {
            bool appInitialized = true;
       
            phy_tcpipStat = TCPIP_STACK_Status(sysObj.tcpip);
            if(phy_tcpipStat < 0)
            {   // some error occurred
                phyData.state = PHY_STATE_ERROR;
				appInitialized = false;
            }
            else if(phy_tcpipStat == SYS_STATUS_READY)
            {
                // now that the stack is ready we can check the
                // available interfaces
                phy_nNets = TCPIP_STACK_NumberOfNetworksGet();
                for(i = 0; i < phy_nNets; i++)
                {
                    phy_netH = TCPIP_STACK_IndexToNet(i);
                }
                phyData.txTaskState = PHY_TCPIP_WAIT_FOR_IP;
            }

        
            if (appInitialized)
            {
            
                phyData.state = PHY_STATE_SERVICE_TASKS;
            }
            break;
        }

        case PHY_STATE_SERVICE_TASKS:
        {
            TCP_Client_TX_Task();
        
            break;
        }

        /* TODO: implement your application state machine.*/
        
        case PHY_STATE_ERROR:
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
