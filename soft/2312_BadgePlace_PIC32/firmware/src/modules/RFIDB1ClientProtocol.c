/**
 *
 * @file      RFIDB1ClientProtocol.c
 * @brief     Protocol for RFIDB1 interface
 * @author    Marcin Baliniak, Piotr Szmelcer
 * @date      08/05/2017
 * @copyright Eccel Technology Ltd
 */

#include <stdio.h>
#include <stdlib.h>
//#include <unistd.h>
//#include <termios.h>
#include <fcntl.h>
#include <string.h>
//#include <mcrypt.h>

#include "RFIDB1ClientProtocol.h"
#include "ccittcrc.h"


/**
    @brief  Function used to count DEL-bytes in buff.
    @param[in]  buff - pointer to input RAW data which will be DLE-modified.
    @param[in] size - pointer to a structure where output data will be stored.
    @return Number of DLE-bytes in string
*/
static uint16_t GetDLEBytes(uint8_t *buff, uint16_t size)
{
    uint16_t i;
    uint16_t res = 0;

    for (i = 0; i < size; i++)
        if (buff[i] == B1Header_STX || buff[i] == B1Header_ETX || buff[i] == B1Header_DLE) res++;

    return res;
}

/**
    @brief  Function used to DLE-encode the data.
    @param[in] protocol - protocol pointer
    @param[in/out]  DataSize - number of bytes placed in TxBuff before and after DLE encoding
*/
static RFIDB1ProtocolStatusT DLEEncodeData(Framework_RFIDB1ProtocolObjectT *protocol, uint16_t *DataSize)
{
    uint16_t InputIndex;
    uint16_t OutputIndex;
    uint16_t dleByles = GetDLEBytes(&protocol->TxBuff[1], *DataSize);
    uint8_t *ptr = &protocol->TxBuff[1];

    if (*DataSize + dleByles + 2 > protocol->TxBuffSizeMax)
        return RFIDB1ProtocolStatusT_TxDataOverflow;

    InputIndex = *DataSize;

    *DataSize = *DataSize + dleByles;

    OutputIndex = *DataSize - 1;

    do
    {
        InputIndex--;
        if (ptr[InputIndex] == B1Header_STX) {
            ptr[OutputIndex--] = B1Header_STX + B1Header_DLE;
            ptr[OutputIndex--] = B1Header_DLE;
        } else if (ptr[InputIndex] == B1Header_ETX) {
            ptr[OutputIndex--] = B1Header_ETX + B1Header_DLE;
            ptr[OutputIndex--] = B1Header_DLE;
        } else if (ptr[InputIndex] == B1Header_DLE) {
            ptr[OutputIndex--] = B1Header_DLE + B1Header_DLE;
            ptr[OutputIndex--] = B1Header_DLE;
        } else {
            ptr[OutputIndex--] = ptr[InputIndex];
        }
    } while (InputIndex > 0);

    return RFIDB1ProtocolStatusT_OK;
}

/**
    @brief  Function used to process incoming data byte by byte.
    @note   Function processed incoming data in compatibility with configuration in ApplicationVolatileConfiguration.
    @param[in] protocol - protocol pointer
    @param[in] DataByte - next received byte of data.
    @return RFIDB1UARTDriverStatusT_InvalidPacket - received packet is invalid.
    @return RFIDB1UARTDriverStatusT_IncompletePacket - packet is not fully read.
    @return RFIDB1ProtocolStatusT_RxDataOverflow - in Rx packet is bigger than allocated Rx buff size
    @return RFIDB1UARTDriverStatusT_OK - correct packet received.
*/
static RFIDB1ProtocolStatusT ProcessDataByte(Framework_RFIDB1ProtocolObjectT *protocol, uint8_t DataByte) {
    bool PacketComplete = false;

    switch (protocol->HeaderType) {
        case HeaderTypeA:
            if (protocol->Receiving == false) {
                if (DataByte == B1Header_STX) {
                   // beginning of transmission, byte is discarted
                   protocol->Header[0] = DataByte;
                   protocol->Receiving = true;
                   protocol->ByteCounter = 0;
                }
            } else {
                switch (protocol->ByteCounter++) {
                    case 0: //Header->DataSize LSB
                        protocol->DataSize = DataByte;
                        protocol->Header[1] = DataByte;
                        break;

                    case 1: //Header->DataSize MSB
                        protocol->DataSize += ((uint16_t)DataByte) << 8;
                        protocol->Header[2] = DataByte;
                        if (protocol->DataSize == 0 || protocol->DataSize > protocol->RxBuffSizeMax) {

                            protocol->Receiving = false;
                            protocol->ByteCounter = 0;
                            return RFIDB1ProtocolStatusT_RxDataOverflow;
                        }
                        break;

                    case 2: //Header->CRC LSB
                        protocol->HeaderCRC = DataByte;
                        break;

                    case 3: //Header->CRC MSB
                        protocol->HeaderCRC += ((uint16_t)DataByte) << 8;

                        if (protocol->HeaderCRC != GetCCITTCRC(protocol->Header, 3)) {
                            return RFIDB1ProtocolStatusT_CRCError;
                        }
                         break;

                    default:
                        protocol->RxBuff[protocol->ByteCounter - 5] = DataByte;
                        if ((protocol->ByteCounter - 4) == protocol->DataSize) {
                            protocol->Receiving = false;
                            PacketComplete = true;
                            protocol->RxBuffSize = protocol->DataSize;
                            protocol->HeaderType = protocol->NewHeaderType;
                            if (protocol->HeaderType == HeaderTypeA)
                                protocol->HeaderSize = 5;
                            else
                                protocol->HeaderSize = 1;
                            protocol->ByteCounter = 0;
                            return RFIDB1ProtocolStatusT_OK;
                        }
                }
            }
            break;

        case HeaderTypeB:
            if (protocol->Receiving == false) {
                if (DataByte == B1Header_STX) {
                   // beginning of transmission, byte is discarted
                   protocol->Receiving = true;
                   protocol->ByteCounter = 0;
                }
            } else {
                if (DataByte == B1Header_ETX) {
                    // end of transmission
                    protocol->Receiving = false;
                    PacketComplete = true;

                    protocol->RxBuffSize = protocol->ByteCounter;
                    protocol->HeaderType = protocol->NewHeaderType;
                    if (protocol->HeaderType == HeaderTypeA)
                        protocol->HeaderSize = 5;
                    else
                        protocol->HeaderSize = 1;

                    protocol->ByteCounter = 0;
                    return RFIDB1ProtocolStatusT_OK;

                } else if (DataByte == B1Header_DLE) {
                    protocol->DLEReceived = true;
                } else {
                    if (protocol->DLEReceived) {
                        DataByte -= B1Header_DLE;
                        protocol->DLEReceived = false;
                    }
                    if (protocol->ByteCounter >= protocol->RxBuffSizeMax) {
                        protocol->Receiving = false;
                        protocol->ByteCounter = 0;
                        break;
                    }
                    if (protocol->ByteCounter >= protocol->RxBuffSizeMax)
                    {
                        protocol->Receiving = false;
                        return RFIDB1ProtocolStatusT_RxDataOverflow;
                    }

                    protocol->RxBuff[protocol->ByteCounter++] = DataByte;
                }
            }
            break;

        default:
            break;
    }
    if (PacketComplete == false) {
        return RFIDB1ProtocolStatusT_Incomplite;
    } else {
        return RFIDB1ProtocolStatusT_OK;
    }
}

/**
    @brief  Function used to Create outgoing packet using data already placed in TxBuff
    @param[in] protocol - protocol pointer
    @param[in] HeaderType - next received byte of data.
    @param[in] DataSize - data size in TxBuff.
    @return RFIDB1ProtocolStatusT_InvalidParameters - wrong input parameters
    @return RFIDB1ProtocolStatusT_TxDataOverflow - if Tx buffer is to small to create packet
    @return RFIDB1UARTDriverStatusT_OK - correct packet received.
*/
static RFIDB1ProtocolStatusT CreateTxPacket(Framework_RFIDB1ProtocolObjectT *protocol, uint16_t DataSize)
{
    uint16_t CalculatedCRC = 0;
    RFIDB1ProtocolStatusT status;

    if (DataSize == 0)
        return RFIDB1ProtocolStatusT_InvalidParameters;

    switch (protocol->HeaderType) {
        case HeaderTypeA:
            if (DataSize + 5 > protocol->TxBuffSizeMax) {
                return RFIDB1ProtocolStatusT_TxDataOverflow;
            }
            protocol->TxBuff[0] = B1Header_STX;
            protocol->TxBuff[1] = (uint8_t)(DataSize & 0x00FF);
            protocol->TxBuff[2] = (uint8_t)((DataSize & 0xFF00) >> 8);

            CalculatedCRC = GetCCITTCRC(protocol->TxBuff, 3);
            protocol->TxBuff[3] = (uint8_t)((CalculatedCRC ) & 0x00FF);
            protocol->TxBuff[4] = (uint8_t)(((CalculatedCRC ) & 0xFF00) >> 8);

            DataSize += 5;

            protocol->TxBuffSize = DataSize;
            break;

        case HeaderTypeB:
            protocol->TxBuff[0] = B1Header_STX;
            status = DLEEncodeData(protocol, &DataSize);
            if (status!= RFIDB1ProtocolStatusT_OK)
                return status;
            DataSize++;//STX
            protocol->TxBuff[DataSize] = B1Header_ETX;
            DataSize++;//ETX
            protocol->TxBuffSize = DataSize;
            break;

        default:
            return RFIDB1ProtocolStatusT_SubModuleError;
    }

    return RFIDB1ProtocolStatusT_OK;
}

/**
	@brief Function gets data packet from UART and put in to RxBuff
	@param[in] protocol - protocol pointer
	@param[out] DataSize - received data size
	@param[in] UartData - incoming data
	@param[in] UartDataSize - incoming data size
    @return RFIDB1ProtocolStatusT_OK.
    @return RFIDB1ProtocolStatusT_InvalidParameters - Null pointers received.
    @return RFIDB1ProtocolStatusT_RxDataOverflow - Data from Uart is greater then pointed DataSize.
    @return RFIDB1ProtocolStatusT_InvalidPacket - unexpected packet size.
    @return RFIDB1ProtocolStatusT_CRCError - CRC error in received data.
    @return RFIDB1ProtocolStatusT_NoRxPackets - No packets received.
	*/
static RFIDB1ProtocolStatusT GetB1Packet(Framework_RFIDB1ProtocolObjectT *protocol, uint16_t *DataSize, uint8_t *UartData, uint16_t *UartDataSize) {
    uint16_t CalculatedCRC = 0;
    uint16_t ReceivedCRC = 0;
    uint16_t k;
    uint8_t tmp[322];
    RFIDB1ProtocolStatusT status = RFIDB1ProtocolStatusT_Error;

    memset(tmp, 0x00, sizeof(tmp));

    if (DataSize == NULL || UartData == NULL || UartDataSize == NULL)
        return RFIDB1ProtocolStatusT_InvalidParameters;

    for (k = 0; k < *UartDataSize && status != RFIDB1ProtocolStatusT_OK && status != RFIDB1ProtocolStatusT_CRCError ; k++)
        status = ProcessDataByte(protocol, UartData[k]);

    memmove(UartData, &UartData[k], *UartDataSize - k);
    *UartDataSize -= k;

    if (status != RFIDB1ProtocolStatusT_OK)
        return status;

    *DataSize = protocol->RxBuffSize;

    switch (protocol->DataType) {

        //Plain
        case DataTypePlain:
            if (*DataSize < 3) { //Status + CRC
                return RFIDB1ProtocolStatusT_InvalidPacket;
            }
            ReceivedCRC = ((uint16_t)(protocol->RxBuff[*DataSize-2])) | ((uint16_t)(protocol->RxBuff[*DataSize-1]) << 8);
            CalculatedCRC = GetCCITTCRC(protocol->RxBuff, *DataSize-2);
            if (CalculatedCRC != ReceivedCRC)
                return RFIDB1ProtocolStatusT_CRCError;

            *DataSize -= 2; //Last Two bytes are CRC.
            return RFIDB1ProtocolStatusT_OK;

        //Encrypted + CRC
        case DataTypeEncrypted:
            if (!protocol->AesDecryptBuffer)
                return RFIDB1ProtocolStatusT_CommunicationParametersNotSet;
            //Size check. Must be multiple of 16.
            if (*DataSize % 16 != 0)
                return RFIDB1ProtocolStatusT_InvalidPacket;

            protocol->AesDecryptBuffer(protocol->RxBuff, (uint32_t)*DataSize, protocol->AESKey, protocol->AESInitializationVector);

            *DataSize = ((uint32_t)(protocol->RxBuff[1]) << 8) | ((uint32_t)(protocol->RxBuff[0])); //Two first Bytes are data size in encrypted packet.

            if (*DataSize < 5) //Size + Status + CRC
                return RFIDB1ProtocolStatusT_InvalidPacket;

            ReceivedCRC = ((uint16_t)(protocol->RxBuff[*DataSize-1]) << 8) | ((uint16_t)(protocol->RxBuff[*DataSize-2]));

            *DataSize -= 2; //Last Two bytes are CRC.
            CalculatedCRC = GetCCITTCRC(protocol->RxBuff, *DataSize);
            if (CalculatedCRC != ReceivedCRC)
                return RFIDB1ProtocolStatusT_CRCError;

            *DataSize -= 2; //First Two bytes are Data Size.

            return RFIDB1ProtocolStatusT_OK;
        default:
                break;
    }
    //We should never get here.
    return RFIDB1ProtocolStatusT_Error;
}

/**
	@brief Function prepares B1 packet based on current header type and packet encoding.
	@param[in] protocol - protocol pointer
	@param[in] DataSize - data size
    @return RFIDB1ProtocolStatusT_OK.
    @return RFIDB1ProtocolStatusT_InvalidParameters - wrong input parameters.
    @return RFIDB1ProtocolStatusT_TxDataOverflow - Data from Uart is greater then pointed DataSize.
	*/
static RFIDB1ProtocolStatusT PutB1Packet(Framework_RFIDB1ProtocolObjectT *protocol, const uint16_t DataSize)
{
    uint16_t CalculatedCRC = 0;

    if (DataSize == 0)
        return RFIDB1ProtocolStatusT_InvalidParameters;

    switch (protocol->DataType) {
        case DataTypePlain:
           if (DataSize + protocol->HeaderSize + 1 > protocol->TxBuffSizeMax)
                return RFIDB1ProtocolStatusT_TxDataOverflow;

            CalculatedCRC = GetCCITTCRC(&protocol->TxBuff[protocol->HeaderSize], DataSize);
            protocol->TxBuff[protocol->HeaderSize + DataSize] = (uint8_t)((CalculatedCRC ) & 0x00FF);
            protocol->TxBuff[protocol->HeaderSize + DataSize + 1] = (uint8_t)(((CalculatedCRC ) & 0xFF00) >> 8);
            return CreateTxPacket(protocol, DataSize + 2);
        case DataTypeEncrypted:
            {
            uint16_t AESTxDataSize;
            uint8_t AESNullTailSize;

            if (!protocol->AesEncryptBuffer)
                return RFIDB1ProtocolStatusT_CommunicationParametersNotSet;

            AESNullTailSize = 16 - (DataSize + 4) % 16; //+2 for CRC bytes and + for AES data size
            if (AESNullTailSize == 16) {
                AESNullTailSize = 0;
            }
            AESTxDataSize = (( (DataSize+4)/16) * 16) + (( (DataSize+4) % 16) ? 16 : 0); //+2 for CRC bytes and + for AES data size

            if (AESTxDataSize + protocol->HeaderSize + 1 > protocol->TxBuffSizeMax)
                return RFIDB1ProtocolStatusT_TxDataOverflow;

            //Write DataSize at the beginning of packet.
            protocol->TxBuff[protocol->HeaderSize] = (uint8_t)((DataSize+4) & 0x00FF);
            protocol->TxBuff[protocol->HeaderSize+1] = (uint8_t)(((DataSize+4) & 0xFF00) >> 8);

            CalculatedCRC = GetCCITTCRC(&protocol->TxBuff[protocol->HeaderSize], DataSize+2);
            protocol->TxBuff[protocol->HeaderSize + DataSize + 2] = (uint8_t)((CalculatedCRC) & 0x00FF);
            protocol->TxBuff[protocol->HeaderSize + DataSize + 3] = (uint8_t)(((CalculatedCRC) & 0xFF00) >> 8);

            memset(&protocol->TxBuff[protocol->HeaderSize + DataSize + 4], 0, AESNullTailSize); //4 = 2 DataSize bytes + 2 CRC bytes. Null fill.

            protocol->AesEncryptBuffer(&protocol->TxBuff[protocol->HeaderSize], AESTxDataSize, protocol->AESKey, protocol->AESInitializationVector);

            //Send data to uart.
            return CreateTxPacket(protocol, AESTxDataSize);
            }
        default:
                return RFIDB1ProtocolStatusT_SubModuleError;
    }
}

/**
	@brief Function sets protocol header type
	@param[in] protocol - protocol pointer
	@param[in] PacketHeaderType - new header type
    @return RFIDB1ProtocolStatusT_OK.
    @return RFIDB1ProtocolStatusT_InvalidParameters - wrong input parameters.
	*/
static RFIDB1ProtocolStatusT SetPacketHeaderType(Framework_RFIDB1ProtocolObjectT *protocol, HeaderTypeT PacketHeaderType)
{
    if (PacketHeaderType != HeaderTypeA && PacketHeaderType != HeaderTypeB)
        return RFIDB1ProtocolStatusT_InvalidParameters;

    protocol->NewHeaderType = PacketHeaderType;

    if (protocol->Receiving == false)
    {
        protocol->HeaderType = PacketHeaderType;
        if (PacketHeaderType == HeaderTypeA)
            protocol->HeaderSize = 5;
        else
            protocol->HeaderSize = 1;
    }

    return RFIDB1ProtocolStatusT_OK;
}


/**
	@brief Function sets encoding type
	@param[in] protocol - protocol pointer
	@param[in] DataType - new header type
	@param[in] AESKey - AES key, optional, needed only if transmission is encrypted
	@param[in] AESInitializationVector - AES vector, optional, needed only if transmission is encrypted
    @return RFIDB1ProtocolStatusT_OK.
    @return RFIDB1ProtocolStatusT_InvalidParameters - wrong input parameters.
	*/
static RFIDB1ProtocolStatusT SetPacketEncoding(Framework_RFIDB1ProtocolObjectT *protocol, DataTypeT DataType, uint8_t *AESKey, uint8_t *AESInitializationVector)
{
    if (DataType == DataTypeEncrypted)
    {
        if (!AESKey || !AESInitializationVector || !protocol->AesDecryptBuffer || !protocol->AesEncryptBuffer)
            return RFIDB1ProtocolStatusT_InvalidParameters;

        memcpy(protocol->AESKey, AESKey, 16);
        memcpy(protocol->AESInitializationVector, AESInitializationVector, 16);
    }

    protocol->DataType = DataType;
    return RFIDB1ProtocolStatusT_OK;
}

/**
	@brief Function gets pointer to Tx data buff
	@param[in] protocol - protocol pointer
    @return data pointer
	*/
static uint8_t * GetTxBuff(Framework_RFIDB1ProtocolObjectT *protocol)
{
    if (protocol->DataType == DataTypePlain)
        return &protocol->TxBuff[protocol->HeaderSize];
    else
        return &protocol->TxBuff[protocol->HeaderSize + 2];
}

/**
	@brief Function gets pointer to Rx data buff
	@param[in] protocol - protocol pointer
    @return data pointer
    */
static uint8_t * GetRxBuff(Framework_RFIDB1ProtocolObjectT *protocol)
{
    if (protocol->DataType == DataTypePlain)
        return &protocol->RxBuff[0];
    else
        return &protocol->RxBuff[2];
}

/**
	@brief Function initialise protocol
	@param[in] protocol - protocol pointer
	@param[in] config - protocol configuration
    @return RFIDB1ProtocolStatusT_OK.
    @return RFIDB1ProtocolStatusT_InvalidParameters - wrong input parameters.
	*/
static RFIDB1ProtocolStatusT Initialise(Framework_RFIDB1ProtocolObjectT *protocol, RFIDB1_IProtocolConfigurationT *config)
{
    if (!protocol || !config->InputBuffer || !config->OutputBuffer || config->InputBufferSize < 10 || config->OutputBufferSize < 10)
        return RFIDB1ProtocolStatusT_InvalidParameters;

    protocol->TxBuff = config->InputBuffer;
    protocol->TxBuffSizeMax = config->InputBufferSize;
    protocol->RxBuff = config->OutputBuffer;
    protocol->RxBuffSizeMax = config->OutputBufferSize;
    protocol->AesDecryptBuffer = config->AesDecryptBuffer;
    protocol->AesEncryptBuffer = config->AesEncryptBuffer;
    protocol->Receiving = false;
    protocol->ByteCounter = 0;
    protocol->HeaderCRC = 0;
    protocol->DLEReceived = false;
    protocol->DataType   = DataTypePlain;
    return RFIDB1ProtocolStatusT_OK;
}

/**
	@brief Function sets protocol interface functions
	@param[in] protocol - protocol pointer
    @return RFIDB1ProtocolStatusT_OK.
	*/
void GetRFIDB1ProtocolInterface(Framework_RFIDB1ProtocolInterfaceT *protocolInterface)
{
    protocolInterface->Initialise = Initialise;
    protocolInterface->GetB1Packet = GetB1Packet;
    protocolInterface->PutB1Packet = PutB1Packet;
    protocolInterface->SetPacketHeaderType = SetPacketHeaderType;
    protocolInterface->SetPacketEncoding = SetPacketEncoding;
    protocolInterface->GetTxBuff = GetTxBuff;
    protocolInterface->GetRxBuff = GetRxBuff;
}

