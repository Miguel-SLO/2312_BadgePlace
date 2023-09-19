/**
 *
 * @file      RFIDB1ClientProtocol.c
 * @brief     Protocol for RFIDB1 interface
 * @author    Marcin Baliniak, Piotr Szmelcer
 * @date      08/05/2017
 * @copyright Eccel Technology Ltd
 */

#ifndef PROTOCOL_H_INCLUDED
#define PROTOCOL_H_INCLUDED

#include <stdbool.h>
#include <stdint.h>

typedef enum {
    RFIDB1ProtocolStatusT_OK = 0,
    RFIDB1PotocolStatusT_NotInitialized,
    RFIDB1ProtocolStatusT_RxDataOverflow,
    RFIDB1ProtocolStatusT_TxDataOverflow,
    RFIDB1ProtocolStatusT_Timeout,
    RFIDB1ProtocolStatusT_InvalidPacket,
    RFIDB1ProtocolStatusT_Incomplite,
    RFIDB1ProtocolStatusT_CRCError,
    RFIDB1ProtocolStatusT_NoRxPackets,
    RFIDB1ProtocolStatusT_InvalidParameters,
    RFIDB1ProtocolStatusT_UartError,
    RFIDB1ProtocolStatusT_Error,
    RFIDB1ProtocolStatusT_MemoryAllocationError,
    RFIDB1ProtocolStatusT_CommunicationParametersNotSet,
    RFIDB1ProtocolStatusT_SubModuleError
} RFIDB1ProtocolStatusT;

#define B1Header_DLE (0x10)
#define B1Header_ETX (0x03)
#define B1Header_STX (0x02)

typedef enum {
    DataTypePlain = 0,
    DataTypeEncrypted = 1
} DataTypeT;

typedef enum {
    HeaderTypeA = 0,
    HeaderTypeB = 1
}HeaderTypeT;

typedef struct Framework_RFIDB1ProtocolObjectT Framework_RFIDB1ProtocolObjectT;
typedef struct Framework_RFIDB1ProtocolInterfaceT Framework_RFIDB1ProtocolInterfaceT;


typedef struct {
	uint8_t *InputBuffer;		/*!< Pointer to an input buffer which will be used by the driver. */
	uint8_t *OutputBuffer;		/*!< Pointer to an output buffer which will be used by the driver. */
	uint16_t InputBufferSize;	/*!< Size of the input buffer. */
	uint16_t OutputBufferSize;	/*!< Size of the output buffer. */
    void (*AesEncryptBuffer)(uint8_t* buff, uint32_t length, const uint8_t* key, const uint8_t* iv); /*!< Pointer to function for AES encrypt */
    void (*AesDecryptBuffer)(uint8_t* buff, uint32_t length, const uint8_t* key, const uint8_t* iv); /*!< Pointer to function for AES decrypt */
} RFIDB1_IProtocolConfigurationT;

struct Framework_RFIDB1ProtocolObjectT {
    uint8_t  AESInitializationVector[16];
    uint8_t  AESKey[16];
    void (*AesEncryptBuffer)(uint8_t* buff, uint32_t length, const uint8_t* key, const uint8_t* iv);
    void (*AesDecryptBuffer)(uint8_t* buff, uint32_t length, const uint8_t* key, const uint8_t* iv);
    uint8_t *RxBuff;
    uint8_t *TxBuff;
    uint8_t Header[3];
    uint16_t RxBuffSize;
    uint16_t RxBuffSizeMax;
    uint16_t TxBuffSize;
    uint16_t TxBuffSizeMax;
    uint16_t ByteCounter;
    uint16_t DataSize;
    uint16_t HeaderCRC;
    bool Receiving;
    DataTypeT  DataType;
    HeaderTypeT  HeaderType, NewHeaderType;
    uint8_t HeaderSize;
    uint8_t DLEReceived;
};

struct Framework_RFIDB1ProtocolInterfaceT {
    RFIDB1ProtocolStatusT (*Initialise) (Framework_RFIDB1ProtocolObjectT *protocol, RFIDB1_IProtocolConfigurationT *config);
    RFIDB1ProtocolStatusT (*GetB1Packet)(Framework_RFIDB1ProtocolObjectT *protocol, uint16_t *DataSize, uint8_t *UartData, uint16_t *UartDataSize);
    RFIDB1ProtocolStatusT (*PutB1Packet)(Framework_RFIDB1ProtocolObjectT *protocol, const uint16_t DataSize);
    RFIDB1ProtocolStatusT (*SetPacketHeaderType)(Framework_RFIDB1ProtocolObjectT *protocol, HeaderTypeT PacketHeaderType);
    RFIDB1ProtocolStatusT (*SetPacketEncoding)(Framework_RFIDB1ProtocolObjectT *protocol, DataTypeT DataType, uint8_t *AESKey, uint8_t *AESInitializationVector);
    uint8_t * (*GetTxBuff)(Framework_RFIDB1ProtocolObjectT *protocol);
    uint8_t * (*GetRxBuff)(Framework_RFIDB1ProtocolObjectT *protocol);
};

void GetRFIDB1ProtocolInterface(Framework_RFIDB1ProtocolInterfaceT *protocol);


#endif // PROTOCOL_H_INCLUDED
