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

#include "RFIDB1ClientInterface.h"
#include "RFIDB1ClientProtocol.h"

/**
    @brief Function used to disable module via GPIO functions
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_Timeout - if module does not disable in default WAKEUP/DOWN time
    @return B1StatusT_NotInitialized - if hardware functions are not initialised
    @details SetPlatformInterface() should be called before user can use this function
*/
static RFIDB1_StatusT DisableModule(RFIDB1_ObjectT *object)
{
    int k;

    if (!object->setResetPin || !object->setPowerPin || !object->delayMs || !object->getNSleep)
        return B1StatusT_NotInitialized;

    //set RST HIGH to prevent reset factory settings
    object->setResetPin(object, 1);
    object->setPowerPin(object, 0);

    for (k = 0; k < B1TimeoutMs_Startup; k++)
    {
        if (object->getNSleep(object) == 0)
            return B1StatusT_OK;

        object->delayMs(object, 1);
    }

    return B1StatusT_Timeout;
}

/**
    @brief Function used to enable module via GPIO functions
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_Timeout - if module does not enable in default WAKEUP/DOWN time
    @return B1StatusT_NotInitialized - if hardware functions are not initialised
    @details SetPlatformInterface() should be called before user can use this function
*/
static RFIDB1_StatusT EnableModule(RFIDB1_ObjectT *object)
{
    int k;

    if (!object->setResetPin || !object->setPowerPin || !object->delayMs || !object->getNSleep)
        return B1StatusT_NotInitialized;

    object->setResetPin(object, 1);
    object->setPowerPin(object, 1);

    for (k = 0; k < B1TimeoutMs_Startup; k++)
    {
        if (object->getNSleep(object) == 1)
            return B1StatusT_OK;

        object->delayMs(object, 1);
    }

    return B1StatusT_Timeout;
}

/**
    @brief Function used to reset module via GPIO functions
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_NotInitialized - if hardware functions are not initialised
    @details SetPlatformInterface() should be called before user can use this function
*/
static RFIDB1_StatusT HardResetModule(RFIDB1_ObjectT *object)
{

    if (!object->setResetPin || !object->setPowerPin || !object->delayMs || !object->getNSleep)
        return B1StatusT_NotInitialized;

    object->setResetPin(object, 0);

    object->delayMs(object, 10);

    object->setResetPin(object, 1);

    object->delayMs(object, B1TimeoutMs_Startup);

    return B1StatusT_OK;
}

/**
    @brief Function used to reset device to factory default module via GPIO functions
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_NotInitialized - if hardware functions are not initialised
    @details SetPlatformInterface() should be called before user can use this function
    should be used in case of communication problems
*/
static RFIDB1_StatusT ResetToDefaults(RFIDB1_ObjectT *object)
{
    int nSleep;

    if (!object->setResetPin || !object->setPowerPin || !object->delayMs || !object->getNSleep)
        return B1StatusT_NotInitialized;

    nSleep = object->getNSleep(object);

    if (DisableModule(object) != B1StatusT_OK)
        return B1StatusT_SubModuleError;

    if (HardResetModule(object) != B1StatusT_OK)
        return B1StatusT_SubModuleError;

    //if module was enabled before
    if (nSleep)
    {
        if (EnableModule(object) != B1StatusT_OK)
            return B1StatusT_SubModuleError;
    }

    return B1StatusT_OK;
}

/**
    @brief Function used to store pointer for user data. eg to keep device descriptor for serial device
    @param[in] object - Pointer to RFIDB1 object
    @param[in] data - Pointer to user data
*/
void SetUserData(RFIDB1_ObjectT *object, void *data)
{
    object->UserData = data;
}

/**
    @brief Function used to reset device to factory default module via GPIO functions
    @param[in] object - Pointer to RFIDB1 object
    @return - Pointer to user data
*/
void* GetUserData(RFIDB1_ObjectT *object)
{
    return object->UserData;
}


/**
    @brief Function used to change packet header type on the application side
    @param[in] object - Pointer to RFIDB1 object
    @param[in] PacketHeaderType - header type B1SerialHeaderConstruction_TypeA or B1SerialHeaderConstruction_TypeB
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
*/
static RFIDB1_StatusT SetPacketHeaderType(RFIDB1_ObjectT *object, HeaderTypeT PacketHeaderType)
{
    if (object->ProtocolInterface.SetPacketHeaderType(&object->ProtocolObject,PacketHeaderType) !=RFIDB1ProtocolStatusT_OK)
        return B1StatusT_InvalidParameters;
    else
        return B1StatusT_OK;
}

/**
    @brief Function used to change packet encoding on the application side
    @param[in] object - Pointer to RFIDB1 object
    @param[in] PacketEncoding - encoding type B1SerialDataConstruction_Plain or B1SerialDataConstruction_Encrypted
    @param[in] AESKey - pointer to AES key
    @param[in] AESInitializationVector - pointer to AES vector
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
    @detail Should be used after switching module to new encoding type using SetDataType function
*/
static RFIDB1_StatusT SetPacketEncoding(RFIDB1_ObjectT *object, uint8_t PacketEncoding, uint8_t *AESKey, uint8_t *AESInitializationVector)
{
    if (object->ProtocolInterface.SetPacketEncoding(&object->ProtocolObject, PacketEncoding, AESKey, AESInitializationVector) !=RFIDB1ProtocolStatusT_OK)
        return B1StatusT_InvalidParameters;
    else
        return B1StatusT_OK;
}

/**
    @brief Function used to parse UART incoming data
    @param[in] object - Pointer to RFIDB1 object
    @param[in] data - data pinter
    @param[in] size - size of incoming data
    @return B1StatusT_OK - if any correct packet received
    @return B1StatusT_NoRxPackets
    @details If function decode correct B1 packet call user function handleResponse()
*/
static RFIDB1_StatusT ParseIncomingData(RFIDB1_ObjectT *object, uint8_t *data, uint16_t size)
{
    uint8_t *buff;
    uint16_t length;
    RFIDB1ProtocolStatusT status;
    RFIDB1_StatusT res = B1StatusT_NoRxPackets;

    do
    {
        status = object->ProtocolInterface.GetB1Packet(&object->ProtocolObject, &length, data, &size);
        if (status == RFIDB1ProtocolStatusT_OK)
        {
            res = B1StatusT_OK;
            buff = object->ProtocolInterface.GetRxBuff(&object->ProtocolObject);
            object->handleResponse(object, buff, length);
        }
    } while (size > 0);

    return res;
}

/**
    @brief Internal function user to prepare packet and send if writePacked is set
    @param[in] object - Pointer to RFIDB1 object
    @param[in] size - data size already copied in to Tx buff
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
*/
static RFIDB1_StatusT SendPacket(RFIDB1_ObjectT *object, uint16_t size)
{
    RFIDB1ProtocolStatusT res;

    res = object->ProtocolInterface.PutB1Packet(&object->ProtocolObject, size);

    if (object->ProtocolObject.HeaderSize + size + 1 > object->ProtocolObject.TxBuffSizeMax)
        return B1StatusT_TxDataOverflow;

    if (res != RFIDB1ProtocolStatusT_OK)
        return B1StatusT_SubModuleError;

    if (object->handleRequest)
        object->handleRequest(object, object->ProtocolObject.TxBuff, object->ProtocolObject.TxBuffSize);

    return B1StatusT_OK;
}

/**
    @brief Function used to send dummy command packet
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendDummyCommand(RFIDB1_ObjectT *object)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);
    buff[0] =B1RequestCommandDummy;

    return SendPacket(object, 1);
}

/**
    @brief Function used to send write to RFID memory command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] Address - RFID module memory address.
    @param[in] TxData - Pointer to Data.
    @param[in] TxDataSize - Size of Data
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendWriteToRFIDMemoryCommand(RFIDB1_ObjectT *object, const uint16_t Address, const uint8_t *TxData, const uint16_t TxDataSize)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    if (TxData == NULL || TxDataSize == 0)
        return B1StatusT_InvalidParameters;

    if (object->ProtocolObject.HeaderSize + TxDataSize + 1 > object->ProtocolObject.TxBuffSizeMax)
        return B1StatusT_TxDataOverflow;
    //Move data in buffer.
    memcpy(&buff[5], TxData, TxDataSize);

    //send command B1RequestCommandWriteToRFIDMemory
    buff[0] = B1RequestCommandWriteToRFIDMemory;
    buff[1] = (uint8_t)(Address & 0xFF);
    buff[2] = (uint8_t)((Address & 0xFF00) >> 8);
    buff[3] = (uint8_t)(TxDataSize & 0xFF);
    buff[4] = (uint8_t)((TxDataSize & 0xFF00) >> 8);

    return SendPacket(object, TxDataSize+5);
}

/**
    @brief Function used to send read from RFID memory command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] Address - RFID module memory address.
    @param[in] BytesToRead - Bytes to read.
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendReadFromRFIDMemoryCommand(RFIDB1_ObjectT *object, const uint16_t Address, uint16_t BytesToRead)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    if (BytesToRead == 0)
        return B1StatusT_InvalidParameters;

    buff[0] = B1RequestCommandReadFromRFIDMemory;
    buff[1] = (uint8_t)(Address & 0xFF);
    buff[2] = (uint8_t)((Address & 0xFF00) >> 8);
    buff[3] = (uint8_t)(BytesToRead & 0xFF);
    buff[4] = (uint8_t)((BytesToRead & 0xFF00) >> 8);

    return SendPacket(object, 5);
}

/**
    @brief Function used to send EnterSleepMode command.
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendEnterSleepModeCommand(RFIDB1_ObjectT *object)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandEnterSleepMode;

    return SendPacket(object, 1);
}

/**
    @brief Function used to send SoftwareReset command.
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendSoftwareResetCommand(RFIDB1_ObjectT *object)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandReset;

    return SendPacket(object, 1);
}

/**
    @brief Function used to send SetBaudRate command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] BaudRate - new baudrate
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
    User should wait 50ms after receiving ACK.
*/
static RFIDB1_StatusT SendSetBaudRateCommand(RFIDB1_ObjectT *object, uint32_t BaudRate)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandSetBaudRate;
    buff[1] = (uint8_t)(BaudRate & 0xFF);
    buff[2] = (uint8_t)((BaudRate & 0xFF00) >> 8);
    buff[3] = (uint8_t)((BaudRate & 0xFF0000) >> 16);
    buff[4] = (uint8_t)((BaudRate & 0xFF000000) >> 24);

    return SendPacket(object, 5);
}

/**
    @brief Function used to send SetDataType command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] DataType - new data type B1SerialDataConstruction_Plain or B1SerialDataConstruction_Encrypted
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
    User should wait 50ms after receiving ACK.
*/
static RFIDB1_StatusT SendSetDataTypeCommand(RFIDB1_ObjectT *object, DataTypeT DataType)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandSetDataType;
    buff[1] = DataType;

    return SendPacket(object, 2);
}

/**
    @brief Function used to send SetHeaderType command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] HeaderType - new header type B1SerialHeaderConstruction_TypeA or B1SerialHeaderConstruction_TypeB
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
    User should wait 50ms after receiving ACK.
*/
static RFIDB1_StatusT SendSetHeaderTypeCommand(RFIDB1_ObjectT *object, HeaderTypeT HeaderType)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandSetHeaderType;
    buff[1] = HeaderType;

    return SendPacket(object, 2);
}

/**
    @brief Function used to send SetAESInitVector command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] HeaderType - new header type B1SerialHeaderConstruction_TypeA or B1SerialHeaderConstruction_TypeB
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
    User should wait 50ms after receiving ACK.
*/
static RFIDB1_StatusT SendSetAESInitVectorCommand(RFIDB1_ObjectT *object, uint8_t *AESInitializationVector)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    if (object->ProtocolObject.HeaderSize + 16 + 1 > object->ProtocolObject.TxBuffSizeMax)
        return B1StatusT_TxDataOverflow;

    buff[0] = B1RequestCommandSetAESInitVector;
    memcpy(&buff[1], AESInitializationVector, 16);

    return SendPacket(object, 17);
}

/**
    @brief Function used to send SetAESKey command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] HeaderType - new header type B1SerialHeaderConstruction_TypeA or B1SerialHeaderConstruction_TypeB
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
    User should wait 50ms after receiving ACK.
*/
static RFIDB1_StatusT SendSetAESKeyCommand(RFIDB1_ObjectT *object, uint8_t *AESKey)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    if (object->ProtocolObject.HeaderSize + 16 + 1 > object->ProtocolObject.TxBuffSizeMax)
        return B1StatusT_TxDataOverflow;

    buff[0] = B1RequestCommandSetAESKey;
    memcpy(&buff[1], AESKey, 16);

    return SendPacket(object, 17);
}

/**
    @brief Function used to send SetIOState command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] HeaderType - new header type B1SerialHeaderConstruction_TypeA or B1SerialHeaderConstruction_TypeB
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
    User should wait 50ms after receiving ACK.
*/
static RFIDB1_StatusT SendSetIOStateCommand(RFIDB1_ObjectT *object, const GpioT Gpio, const GpioStateT GpioState)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandSetIOState;
    buff[1] = Gpio;
    buff[2] = GpioState;

    return SendPacket(object, 3);
}

/**
    @brief Function used to send ReadIOState command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] IONumber - GPIO number.
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendReadIOStateCommand(RFIDB1_ObjectT *object, const GpioT Gpio)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandReadIOState;
    buff[1] = Gpio;

    return SendPacket(object, 2);
}

/**
    @brief Function used to send SetIOInterrupt command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] IONumber - GPIO number.
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendSetIOInterruptCommand(RFIDB1_ObjectT *object, const GpioT Gpio, const GpioInterruptT GpioInterrupt)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandSetIOInterrupt;
    buff[1] = Gpio;
    buff[2] = GpioInterrupt;

    return SendPacket(object, 3);
}

/**
    @brief Function used to send MeasureVoltage command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] VoltageSource - Source of voltage measurment.
    @param[in] VoltageFormat - Format of returned value.
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendMeasureVoltageCommand(RFIDB1_ObjectT *object, const AdcSourceT AdcSource, const VoltageFormatT VoltageFormat)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandMeasureVoltage;
    buff[1] = AdcSource;
    buff[2] = VoltageFormat;

    return SendPacket(object, 3);
}

/**
    @brief Function used to send MeasureDieTemperature command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] TemperatureFormat - Temperature format configuration byte.
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendMeasureDieTemperatureCommand(RFIDB1_ObjectT *object, const TemperatureFormatT TemperatureFormat)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandMeasureDieTemperature;
    buff[1] = TemperatureFormat;

    return SendPacket(object, 2);
}

/**
    @brief Function used to send SetIDACCurrent command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] CurrentFormat - Current format.
    @param[in] CurrentValue - pointer to Value for set.
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendSetIDACCurrentCommand(RFIDB1_ObjectT *object, const CurrentFormatT CurrentFormat, void *CurrentValue)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);
    uint32_t *CurrentValueP = CurrentValue;

    buff[0] = B1RequestCommandSetIDACCurrent;
    buff[1] = CurrentFormat;
    buff[2] = (uint8_t)(*CurrentValueP & 0xFF);
    buff[3] = (uint8_t)((*CurrentValueP & 0xFF00) >> 8);
    buff[4] = (uint8_t)((*CurrentValueP & 0xFF0000) >> 16);
    buff[5] = (uint8_t)((*CurrentValueP & 0xFF000000) >> 24);

    return SendPacket(object, 6);
}

/**
    @brief Function used to send EnableComparator command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] ComparatorInputConfig - Comparator input configuration byte.
    @param[in] PowerSupplyDividerValue - Power supply divider value (0-63).
    @param[in] ComparatorOutputConfig - Comparator output configuration byte.
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendEnableComparatorCommand(RFIDB1_ObjectT *object, const ComparatorReferenceVoltageT InputConfig, const ComparatorOutputPinT OutputPinConfig, const ComparatorAsyncPacketEdgeSensitivityT PacketConfig, const uint8_t PowerSupplyDividerValue)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    if (PowerSupplyDividerValue > 0x3F)
        return B1StatusT_InvalidParameters;

    buff[0] = B1RequestCommandEnableComparator;
    buff[1] = InputConfig;
    buff[2] = OutputPinConfig;
    buff[3] = PacketConfig;
    buff[4] = PowerSupplyDividerValue;

    return SendPacket(object, 5);
}

/**
    @brief Function used to send DisableComparator command.
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendDisableComparatorCommand(RFIDB1_ObjectT *object)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandDisableComparator;

    return SendPacket(object, 1);
}

/**
    @brief Function used to send EnablePWM command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] IONumber - GPIO number.
    @param[in] DutyCycle - Duty cycle in %.
    @param[in] ValueFormat - PWM frequency or period format.
    @param[in] Value - frequency or period value.
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/

static RFIDB1_StatusT SendEnablePWMCommand(RFIDB1_ObjectT *object, PWMConfigFormatT PWMConfigFormat, void *Value, GpioT Gpio, uint8_t DutyCycle)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);
    uint32_t *ValueP = (uint32_t*)Value;

    buff[0] = B1RequestCommandEnablePWM;
    buff[1] = Gpio;
    buff[2] = DutyCycle;
    buff[3] = PWMConfigFormat;
    buff[4] = (uint8_t)(*ValueP & 0xFF);
    buff[5] = (uint8_t)((*ValueP & 0xFF00) >> 8);
    buff[6] = (uint8_t)((*ValueP & 0xFF0000) >> 16);
    buff[7] = (uint8_t)((*ValueP & 0xFF000000) >> 24);

   return SendPacket(object, 8);
}

/**
    @brief Function used to send ReadAESInitVector command.
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendReadAESInitVectorCommand(RFIDB1_ObjectT *object)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandReadAESInitVector;

    return SendPacket(object, 1);
}

/**
    @brief Function used to send ReadAESKey command.
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendReadAESKeyCommand(RFIDB1_ObjectT *object)
{
    uint8_t *buff = object->ProtocolInterface.GetTxBuff(&object->ProtocolObject);

    buff[0] = B1RequestCommandReadAESKey;

    return SendPacket(object, 1);
}


/**
    @brief Function used to send raw command.
    @param[in] object - Pointer to RFIDB1 object
    @param[in] Data - pointer to data buffer.
    @param[in] Size - data size
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendRawDataCommand(RFIDB1_ObjectT *object, uint8_t *Data, uint16_t Size)
{
    if (Size > object->ProtocolObject.TxBuffSizeMax)
        return B1StatusT_TxDataOverflow;

    memcpy(object->ProtocolObject.TxBuff, Data, Size);
    object->ProtocolObject.TxBuffSize = Size;

    if (object->handleRequest)
        object->handleRequest(object, object->ProtocolObject.TxBuff, object->ProtocolObject.TxBuffSize);

    return B1StatusT_OK;
}

/**
    @brief Function used to send wake up command
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendWakeUpByte(RFIDB1_ObjectT *object)
{
    object->ProtocolObject.TxBuff[0] = 0x00;
    object->ProtocolObject.TxBuffSize = 1;

    if (object->handleRequest)
        object->handleRequest(object, object->ProtocolObject.TxBuff, object->ProtocolObject.TxBuffSize);

    return B1StatusT_OK;

}

/**
    @brief Function used to send wake up command
    @param[in] object - Pointer to RFIDB1 object
    @return B1StatusT_OK
    @return B1StatusT_SubModuleError
    @details Incoming ACK will be received via handleResponse.
*/
static RFIDB1_StatusT SendStxByte(RFIDB1_ObjectT *object)
{
    object->ProtocolObject.TxBuff[0] = B1Header_STX;
    object->ProtocolObject.TxBuffSize = 1;

    if (object->handleRequest)
        object->handleRequest(object, object->ProtocolObject.TxBuff, object->ProtocolObject.TxBuffSize);

    return B1StatusT_OK;

}

/**
    @brief Function used to setup platform interface
    @param[in] object - Pointer to RFIDB1 object
    @param[in] getNSleep - pointer to function used to read nSleep state
    @param[in] setResetPin - pointer to function used to set Reset pin state
    @param[in] setPowerPin - pointer to function used to set Power pin state
    @param[in] delayMs - pointer to function used to wait requested milliseconds
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
    @details User don't need to initialize this function if wan't to use only UART interface
*/
RFIDB1_StatusT SetPlatformInterface(RFIDB1_ObjectT *object, int (*getNSleep)(RFIDB1_ObjectT *), void (*setResetPin)(RFIDB1_ObjectT *, int), void (*setPowerPin)(RFIDB1_ObjectT *, int), void (*delayMs)(RFIDB1_ObjectT *, int))
{
    if (!object || !getNSleep || !setResetPin || !setPowerPin || !delayMs)
        return B1StatusT_InvalidParameters;

    object->getNSleep = getNSleep;
    object->setResetPin = setResetPin;
    object->setPowerPin = setPowerPin;
    object->delayMs = delayMs;

    return B1StatusT_OK;
}

/**
    @brief Function used to initialise object
    @param[in] object - Pointer to RFIDB1 object
    @param[in] config - Pointer to RFIDB1 configuration
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
    @detail This function should be called just after GetRFIDB1Interface() with full configuration for RFIDB1 interface
*/
static RFIDB1_StatusT Initialise(RFIDB1_ObjectT *object, RFIDB1_InterfaceConfigurationT *config)
{
    RFIDB1_IProtocolConfigurationT protocolConfig;

    if (!object || !config->handleRequest || !config->handleResponse)
        return B1StatusT_InvalidParameters;

    object->handleRequest = config->handleRequest;
    object->handleResponse = config->handleResponse;

    //optional functions
    if (config->getNSleep)
        object->getNSleep = config->getNSleep;

    if (config->setResetPin)
        object->setResetPin = config->setResetPin;

    if (config->setPowerPin)
        object->setPowerPin = config->setPowerPin;

    if (config->delayMs)
        object->delayMs = config->delayMs;

    GetRFIDB1ProtocolInterface(&object->ProtocolInterface);

    protocolConfig.InputBuffer = config->InputBuffer;
    protocolConfig.InputBufferSize = config->InputBufferSize;
    protocolConfig.OutputBuffer = config->OutputBuffer;
    protocolConfig.OutputBufferSize = config->OutputBufferSize;
    protocolConfig.AesDecryptBuffer = config->AesDecryptBuffer;
    protocolConfig.AesEncryptBuffer = config->AesEncryptBuffer;

    if (object->ProtocolInterface.Initialise(&object->ProtocolObject, &protocolConfig) != RFIDB1ProtocolStatusT_OK)
        return B1StatusT_InvalidParameters;

    return B1StatusT_OK;
}

/**
    @brief Function used to initialise RFIDB1 interface
    @param[in] interface - Pointer to RFIDB1 Interface
    @return B1StatusT_OK
    @return B1StatusT_InvalidParameters
    @detail This function should be called prior Initialise()
*/
RFIDB1_StatusT GetRFIDB1Interface(RFIDB1_InterfaceT *interface)
{

    if (!interface)
        return B1StatusT_InvalidParameters;

    interface->Initialise = Initialise;

    interface->SetUserData = SetUserData;
    interface->GetUserData = GetUserData;

    interface->EnableModule = EnableModule;
    interface->DisableModule = DisableModule;
    interface->HardResetModule = HardResetModule;
    interface->ResetToDefaults = ResetToDefaults;
    interface->ParseIncomingData = ParseIncomingData;
    interface->SetPacketHeaderType = SetPacketHeaderType;
    interface->SetPacketEncoding = SetPacketEncoding;

    interface->SendDummyCommand = SendDummyCommand;
    interface->SendWriteToRFIDMemoryCommand = SendWriteToRFIDMemoryCommand;
    interface->SendReadFromRFIDMemoryCommand = SendReadFromRFIDMemoryCommand;
    interface->SendEnterSleepModeCommand = SendEnterSleepModeCommand;
    interface->SendSoftwareResetCommand = SendSoftwareResetCommand;
    interface->SendSetBaudRateCommand = SendSetBaudRateCommand;
    interface->SendSetDataTypeCommand = SendSetDataTypeCommand;
    interface->SendSetHeaderTypeCommand = SendSetHeaderTypeCommand;
    interface->SendSetIOStateCommand = SendSetIOStateCommand;
    interface->SendReadIOStateCommand = SendReadIOStateCommand;
    interface->SendSetIOInterruptCommand = SendSetIOInterruptCommand;
    interface->SendMeasureVoltageCommand = SendMeasureVoltageCommand;
    interface->SendMeasureDieTemperatureCommand = SendMeasureDieTemperatureCommand;
    interface->SendSetIDACCurrentCommand = SendSetIDACCurrentCommand;
    interface->SendEnableComparatorCommand = SendEnableComparatorCommand;
    interface->SendDisableComparatorCommand = SendDisableComparatorCommand;
    interface->SendEnablePWMCommand = SendEnablePWMCommand;
    interface->SendReadAESInitVectorCommand = SendReadAESInitVectorCommand;
    interface->SendReadAESKeyCommand = SendReadAESKeyCommand;
    interface->SendSetAESInitVectorCommand = SendSetAESInitVectorCommand;
    interface->SendSetAESKeyCommand = SendSetAESKeyCommand;
    interface->SendRawDataCommand = SendRawDataCommand;
    interface->SendWakeUpByte = SendWakeUpByte;
    interface->SendStxByte = SendStxByte;

    return B1StatusT_OK;
}
