#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-2312_Config.mk)" "nbproject/Makefile-local-2312_Config.mk"
include nbproject/Makefile-local-2312_Config.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=2312_Config
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/app.c ../src/main.c ../src/chu.c ../src/esp.c ../src/led.c ../src/bzr.c ../src/modules/fifo.c ../src/modules/RFIDB1ClientInterface.c ../src/modules/RFIDB1ClientProtocol.c ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c ../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../framework/system/random/src/sys_random.c ../../../../../../framework/system/tmr/src/sys_tmr.c ../../../../../../framework/tcpip/src/ipv4.c ../../../../../../framework/tcpip/src/tcp.c ../../../../../../framework/tcpip/src/udp.c ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c ../../../../../../framework/tcpip/src/tcpip_heap_internal.c ../../../../../../framework/tcpip/src/arp.c ../../../../../../framework/tcpip/src/dhcp.c ../../../../../../framework/tcpip/src/dns.c ../../../../../../framework/tcpip/src/nbns.c ../../../../../../framework/tcpip/src/tcpip_announce.c ../../../../../../framework/tcpip/src/common/helpers.c ../../../../../../framework/tcpip/src/hash_fnv.c ../../../../../../framework/tcpip/src/oahash.c ../../../../../../framework/tcpip/src/tcpip_helpers.c ../../../../../../framework/tcpip/src/tcpip_helper_c32.S ../../../../../../framework/tcpip/src/tcpip_manager.c ../../../../../../framework/tcpip/src/tcpip_notify.c ../../../../../../framework/tcpip/src/tcpip_packet.c ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_static_buffer_model.c ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_mapping.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_mapping.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_tasks.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_sys_queue.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c ../src/system_config/2312_Config/system_init.c ../src/system_config/2312_Config/system_interrupt.c ../src/system_config/2312_Config/system_exceptions.c ../src/system_config/2312_Config/system_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/chu.o ${OBJECTDIR}/_ext/1360937237/esp.o ${OBJECTDIR}/_ext/1360937237/led.o ${OBJECTDIR}/_ext/1360937237/bzr.o ${OBJECTDIR}/_ext/946520205/fifo.o ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o ${OBJECTDIR}/_ext/572279899/drv_miim.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ${OBJECTDIR}/_ext/899838009/sys_random.o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ${OBJECTDIR}/_ext/1833714580/ipv4.o ${OBJECTDIR}/_ext/1833714580/tcp.o ${OBJECTDIR}/_ext/1833714580/udp.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ${OBJECTDIR}/_ext/1833714580/arp.o ${OBJECTDIR}/_ext/1833714580/dhcp.o ${OBJECTDIR}/_ext/1833714580/dns.o ${OBJECTDIR}/_ext/1833714580/nbns.o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ${OBJECTDIR}/_ext/593738990/helpers.o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ${OBJECTDIR}/_ext/1833714580/oahash.o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ${OBJECTDIR}/_ext/1708948888/system_init.o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ${OBJECTDIR}/_ext/1708948888/system_tasks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/chu.o.d ${OBJECTDIR}/_ext/1360937237/esp.o.d ${OBJECTDIR}/_ext/1360937237/led.o.d ${OBJECTDIR}/_ext/1360937237/bzr.o.d ${OBJECTDIR}/_ext/946520205/fifo.o.d ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o.d ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o.d ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d ${OBJECTDIR}/_ext/572279899/drv_miim.o.d ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d ${OBJECTDIR}/_ext/899838009/sys_random.o.d ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d ${OBJECTDIR}/_ext/1833714580/ipv4.o.d ${OBJECTDIR}/_ext/1833714580/tcp.o.d ${OBJECTDIR}/_ext/1833714580/udp.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d ${OBJECTDIR}/_ext/1833714580/arp.o.d ${OBJECTDIR}/_ext/1833714580/dhcp.o.d ${OBJECTDIR}/_ext/1833714580/dns.o.d ${OBJECTDIR}/_ext/1833714580/nbns.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d ${OBJECTDIR}/_ext/593738990/helpers.o.d ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d ${OBJECTDIR}/_ext/1833714580/oahash.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o.d ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o.d ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o.d ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o.d ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o.d ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o.d ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o.d ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d ${OBJECTDIR}/_ext/1708948888/system_init.o.d ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/chu.o ${OBJECTDIR}/_ext/1360937237/esp.o ${OBJECTDIR}/_ext/1360937237/led.o ${OBJECTDIR}/_ext/1360937237/bzr.o ${OBJECTDIR}/_ext/946520205/fifo.o ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o ${OBJECTDIR}/_ext/572279899/drv_miim.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ${OBJECTDIR}/_ext/899838009/sys_random.o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ${OBJECTDIR}/_ext/1833714580/ipv4.o ${OBJECTDIR}/_ext/1833714580/tcp.o ${OBJECTDIR}/_ext/1833714580/udp.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ${OBJECTDIR}/_ext/1833714580/arp.o ${OBJECTDIR}/_ext/1833714580/dhcp.o ${OBJECTDIR}/_ext/1833714580/dns.o ${OBJECTDIR}/_ext/1833714580/nbns.o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ${OBJECTDIR}/_ext/593738990/helpers.o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ${OBJECTDIR}/_ext/1833714580/oahash.o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ${OBJECTDIR}/_ext/1708948888/system_init.o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ${OBJECTDIR}/_ext/1708948888/system_tasks.o

# Source Files
SOURCEFILES=../src/app.c ../src/main.c ../src/chu.c ../src/esp.c ../src/led.c ../src/bzr.c ../src/modules/fifo.c ../src/modules/RFIDB1ClientInterface.c ../src/modules/RFIDB1ClientProtocol.c ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c ../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../framework/system/random/src/sys_random.c ../../../../../../framework/system/tmr/src/sys_tmr.c ../../../../../../framework/tcpip/src/ipv4.c ../../../../../../framework/tcpip/src/tcp.c ../../../../../../framework/tcpip/src/udp.c ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c ../../../../../../framework/tcpip/src/tcpip_heap_internal.c ../../../../../../framework/tcpip/src/arp.c ../../../../../../framework/tcpip/src/dhcp.c ../../../../../../framework/tcpip/src/dns.c ../../../../../../framework/tcpip/src/nbns.c ../../../../../../framework/tcpip/src/tcpip_announce.c ../../../../../../framework/tcpip/src/common/helpers.c ../../../../../../framework/tcpip/src/hash_fnv.c ../../../../../../framework/tcpip/src/oahash.c ../../../../../../framework/tcpip/src/tcpip_helpers.c ../../../../../../framework/tcpip/src/tcpip_helper_c32.S ../../../../../../framework/tcpip/src/tcpip_manager.c ../../../../../../framework/tcpip/src/tcpip_notify.c ../../../../../../framework/tcpip/src/tcpip_packet.c ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_static_buffer_model.c ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_mapping.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_mapping.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_tasks.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_sys_queue.c ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c ../src/system_config/2312_Config/system_init.c ../src/system_config/2312_Config/system_interrupt.c ../src/system_config/2312_Config/system_exceptions.c ../src/system_config/2312_Config/system_tasks.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-2312_Config.mk dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512H
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o: ../../../../../../framework/tcpip/src/tcpip_helper_c32.S  .generated_files/642cea905049107ad207ea1aad55ef970ec33c10.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.ok ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d"  -o ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o ../../../../../../framework/tcpip/src/tcpip_helper_c32.S  -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d" "${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o: ../../../../../../framework/tcpip/src/tcpip_helper_c32.S  .generated_files/4fde9f8352c4ac37209e02c6dde66cda63b8284e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.ok ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d"  -o ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o ../../../../../../framework/tcpip/src/tcpip_helper_c32.S  -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d" "${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/8537c42d2c1cd10006a7050d2ffaa7b4594f08ea.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/96e6ef4a5ee6b0e64d29a29e0ab90c796d3bea99.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/chu.o: ../src/chu.c  .generated_files/4476f6cb958eff76b9a35834a447697e4f49e03b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/chu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/chu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/chu.o.d" -o ${OBJECTDIR}/_ext/1360937237/chu.o ../src/chu.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/esp.o: ../src/esp.c  .generated_files/49a0f84c523c79bf2b4453a4c0e34cb4483bf046.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/esp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/esp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/esp.o.d" -o ${OBJECTDIR}/_ext/1360937237/esp.o ../src/esp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/led.o: ../src/led.c  .generated_files/c143fa6837ccac744bae5986c8889e9233bcbe80.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/led.o.d" -o ${OBJECTDIR}/_ext/1360937237/led.o ../src/led.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/bzr.o: ../src/bzr.c  .generated_files/d1cdf21cc509ec1a3a3fdf8ac9e004634005c04e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bzr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bzr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/bzr.o.d" -o ${OBJECTDIR}/_ext/1360937237/bzr.o ../src/bzr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/946520205/fifo.o: ../src/modules/fifo.c  .generated_files/f2596a542a1f2363fd52bbdfec2cbc3e1d5a661d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/946520205" 
	@${RM} ${OBJECTDIR}/_ext/946520205/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/946520205/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/946520205/fifo.o.d" -o ${OBJECTDIR}/_ext/946520205/fifo.o ../src/modules/fifo.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o: ../src/modules/RFIDB1ClientInterface.c  .generated_files/66117a90aaeb39171a64925a780e9c617b9868e6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/946520205" 
	@${RM} ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o.d 
	@${RM} ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o.d" -o ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o ../src/modules/RFIDB1ClientInterface.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o: ../src/modules/RFIDB1ClientProtocol.c  .generated_files/358c04f5694b5e1700f8c6fb235e0f17e0827192.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/946520205" 
	@${RM} ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o.d 
	@${RM} ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o.d" -o ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o ../src/modules/RFIDB1ClientProtocol.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1764881201/drv_ethmac.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c  .generated_files/810c814bccee84756bf701daf6f6ffb27a7fe76c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c  .generated_files/36c320b8afaabbb67b090607553213766450da4a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_ethphy.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c  .generated_files/d221238009b10d0646c38eb2986efe2825942d6f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c  .generated_files/7cbe4daca6d27f4af58c90c6e8412815c383f2b8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/572279899/drv_miim.o: ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c  .generated_files/a0ddad45eec58a24c052f21aa068dfa93127000a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/572279899" 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o.d 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/572279899/drv_miim.o.d" -o ${OBJECTDIR}/_ext/572279899/drv_miim.o ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/282478ba0c85cee7baf6eb1f47d902a8ad315768.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/899838009/sys_random.o: ../../../../../../framework/system/random/src/sys_random.c  .generated_files/4900d947b2146199304e96bfdb4245c817efe9dc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/899838009" 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/899838009/sys_random.o.d" -o ${OBJECTDIR}/_ext/899838009/sys_random.o ../../../../../../framework/system/random/src/sys_random.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/430974239/sys_tmr.o: ../../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/f89a9b78ba41a6e3a63c08f179311625c0012aa6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/430974239" 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/430974239/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ../../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/ipv4.o: ../../../../../../framework/tcpip/src/ipv4.c  .generated_files/544621e80c4b537b578e43d869c017fa5ebf1336.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/ipv4.o.d" -o ${OBJECTDIR}/_ext/1833714580/ipv4.o ../../../../../../framework/tcpip/src/ipv4.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcp.o: ../../../../../../framework/tcpip/src/tcp.c  .generated_files/1cf91e74c750ac5c5e5887fa5d733809364cd69f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcp.o ../../../../../../framework/tcpip/src/tcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/udp.o: ../../../../../../framework/tcpip/src/udp.c  .generated_files/4b6d83c1fd0fc85a58fe783e94e6a765f589a225.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/udp.o.d" -o ${OBJECTDIR}/_ext/1833714580/udp.o ../../../../../../framework/tcpip/src/udp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o: ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c  .generated_files/545a12775a22c404b3f01a7a6dd1a4b346b63f26.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o: ../../../../../../framework/tcpip/src/tcpip_heap_internal.c  .generated_files/238ac090e6220bc76a68911a6c8ac0f1888dfbc0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ../../../../../../framework/tcpip/src/tcpip_heap_internal.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/arp.o: ../../../../../../framework/tcpip/src/arp.c  .generated_files/45b6990c6d276363002f2e4a45b6246e39404f80.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/arp.o.d" -o ${OBJECTDIR}/_ext/1833714580/arp.o ../../../../../../framework/tcpip/src/arp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dhcp.o: ../../../../../../framework/tcpip/src/dhcp.c  .generated_files/22523cd8353c33a31881fd76f9321378be6aa8d2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dhcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/dhcp.o ../../../../../../framework/tcpip/src/dhcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dns.o: ../../../../../../framework/tcpip/src/dns.c  .generated_files/a19e0b0adbde3b39232aef04741569ddee282003.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dns.o.d" -o ${OBJECTDIR}/_ext/1833714580/dns.o ../../../../../../framework/tcpip/src/dns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/nbns.o: ../../../../../../framework/tcpip/src/nbns.c  .generated_files/8309af201225d540a65d4e135c2ff8c7b9b7ef8b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/nbns.o.d" -o ${OBJECTDIR}/_ext/1833714580/nbns.o ../../../../../../framework/tcpip/src/nbns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_announce.o: ../../../../../../framework/tcpip/src/tcpip_announce.c  .generated_files/126ef01ec8c7eae838ac60c4b9e32e4bd9d5d759.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ../../../../../../framework/tcpip/src/tcpip_announce.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/593738990/helpers.o: ../../../../../../framework/tcpip/src/common/helpers.c  .generated_files/4c3c4ea530fa9b4f736aecbbade515170790e87.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/593738990" 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/593738990/helpers.o.d" -o ${OBJECTDIR}/_ext/593738990/helpers.o ../../../../../../framework/tcpip/src/common/helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/hash_fnv.o: ../../../../../../framework/tcpip/src/hash_fnv.c  .generated_files/178a93231a19469fbc2f52522f9e39b1fb99f53a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d" -o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ../../../../../../framework/tcpip/src/hash_fnv.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/oahash.o: ../../../../../../framework/tcpip/src/oahash.c  .generated_files/61deaa1c533dd56ab606624eb9005bb4898aac5e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/oahash.o.d" -o ${OBJECTDIR}/_ext/1833714580/oahash.o ../../../../../../framework/tcpip/src/oahash.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o: ../../../../../../framework/tcpip/src/tcpip_helpers.c  .generated_files/6d24015b079bce80eb14ad28a16c18db01e627f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ../../../../../../framework/tcpip/src/tcpip_helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_manager.o: ../../../../../../framework/tcpip/src/tcpip_manager.c  .generated_files/8d23110d66b61b634442758c0082a38e60e0cc8e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ../../../../../../framework/tcpip/src/tcpip_manager.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_notify.o: ../../../../../../framework/tcpip/src/tcpip_notify.c  .generated_files/751ec385e7fa59399b2d45f816d0415f767076e8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ../../../../../../framework/tcpip/src/tcpip_notify.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_packet.o: ../../../../../../framework/tcpip/src/tcpip_packet.c  .generated_files/83728e3d17d2fad29706bcf00bd1215cd7e009cd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ../../../../../../framework/tcpip/src/tcpip_packet.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o: ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_static_buffer_model.c  .generated_files/1b244f6782a5a58668a24e8d0dce7d023a617c4d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/643353088" 
	@${RM} ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o.d" -o ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_static_buffer_model.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o: ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_mapping.c  .generated_files/b214a81735e3e214c43cd20a1cbc7fd8a4019e41.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/643353088" 
	@${RM} ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o.d" -o ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_static.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static.c  .generated_files/1b909622d093d9088b997da51d7b8622c75def6a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_static.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_mapping.c  .generated_files/cf731c133712ed1cafec4f68789851f80fe37a44.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_tasks.c  .generated_files/a4a8e9b102638a5d56e70c95c736204a6674fd31.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_sys_queue.c  .generated_files/1cc57d11884678ea8558a8c9b674c1aad2686a77.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_sys_queue.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c  .generated_files/331be652979e5de6743093f04832a3a31ae0bd09.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/b0108f73b0a4fabcf39ef8b9cc1f2df26ec5fdcf.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/f654c412ad5c86980b8dacdd8d2689a984611fc1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/600500c7a68d9bca223914211efa251947683ad0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_static.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c  .generated_files/9f059d8dbb43392914a3098ffa4e7b896bc05389.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/b42cb66ba2a1508bdb0f21c004b97b909007c681.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o: ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/9d3d93007355da3b7a8f890938026f970b677acb.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/15694449" 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c  .generated_files/840b7fc8a175b3fe46e70ede430544de5f0aa50d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/b1de9744a431c2c134459a8df52d4ff55e510005.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/604921471/sys_ports_static.o: ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c  .generated_files/6666f5be021f33421b2e847383c7a2d75725c0f5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/604921471" 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_init.o: ../src/system_config/2312_Config/system_init.c  .generated_files/56619ac09e7b3af0a42776ed23404df598a5c498.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_init.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_init.o ../src/system_config/2312_Config/system_init.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_interrupt.o: ../src/system_config/2312_Config/system_interrupt.c  .generated_files/b787088d965307b21ccd4d7ca3251d787e1e0985.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ../src/system_config/2312_Config/system_interrupt.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_exceptions.o: ../src/system_config/2312_Config/system_exceptions.c  .generated_files/748046a75eb418961385e86e5add5f48d5d6ef91.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ../src/system_config/2312_Config/system_exceptions.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_tasks.o: ../src/system_config/2312_Config/system_tasks.c  .generated_files/fcd1040266de07187a9514f4d164843dcdff4ee.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ../src/system_config/2312_Config/system_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/14d0df57da510ec31296d491f0db66243601427e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/a9986287358686f3216506c83ebd93870f31dbd0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/chu.o: ../src/chu.c  .generated_files/22e587907ebdefa781973b5d79f9200821d87a1b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/chu.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/chu.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/chu.o.d" -o ${OBJECTDIR}/_ext/1360937237/chu.o ../src/chu.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/esp.o: ../src/esp.c  .generated_files/79a630de46c54db8c55fb0c50bb934c39a33c4d1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/esp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/esp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/esp.o.d" -o ${OBJECTDIR}/_ext/1360937237/esp.o ../src/esp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/led.o: ../src/led.c  .generated_files/73eed519c18475f12aef8782ba3e8186309bfd82.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/led.o.d" -o ${OBJECTDIR}/_ext/1360937237/led.o ../src/led.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/bzr.o: ../src/bzr.c  .generated_files/a2548f6c1943be7273a044144270d3253213a2d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bzr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bzr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/bzr.o.d" -o ${OBJECTDIR}/_ext/1360937237/bzr.o ../src/bzr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/946520205/fifo.o: ../src/modules/fifo.c  .generated_files/fe21bd217b5f02a1a08ac22ff69404b29a426f54.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/946520205" 
	@${RM} ${OBJECTDIR}/_ext/946520205/fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/946520205/fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/946520205/fifo.o.d" -o ${OBJECTDIR}/_ext/946520205/fifo.o ../src/modules/fifo.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o: ../src/modules/RFIDB1ClientInterface.c  .generated_files/6e34b2f387c6f5b0435e43f4fe95e9661a94e481.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/946520205" 
	@${RM} ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o.d 
	@${RM} ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o.d" -o ${OBJECTDIR}/_ext/946520205/RFIDB1ClientInterface.o ../src/modules/RFIDB1ClientInterface.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o: ../src/modules/RFIDB1ClientProtocol.c  .generated_files/970ee49b8a9fc9f58fbd2e18374c46f7157d85ef.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/946520205" 
	@${RM} ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o.d 
	@${RM} ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o.d" -o ${OBJECTDIR}/_ext/946520205/RFIDB1ClientProtocol.o ../src/modules/RFIDB1ClientProtocol.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1764881201/drv_ethmac.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c  .generated_files/83e31189112541e9c9c4f842760b99e4207cdb69.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c  .generated_files/8819a639ccf442624f180f3bfc078924de1e24a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_ethphy.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c  .generated_files/1ad5fae80c16df27101575d570a32dd10051922d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c  .generated_files/1fbb3f7fb83a1dd7c949e5815ebcc3ac9576fa9d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/572279899/drv_miim.o: ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c  .generated_files/fc94d5c54898c538560f07278972c479313fe9d9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/572279899" 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o.d 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/572279899/drv_miim.o.d" -o ${OBJECTDIR}/_ext/572279899/drv_miim.o ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/3b4cd397199209b2e36093e5d74da07a2ba3d97e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/899838009/sys_random.o: ../../../../../../framework/system/random/src/sys_random.c  .generated_files/8b5f75ee1eb682e381bacc896a03dd6dddc4fe69.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/899838009" 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/899838009/sys_random.o.d" -o ${OBJECTDIR}/_ext/899838009/sys_random.o ../../../../../../framework/system/random/src/sys_random.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/430974239/sys_tmr.o: ../../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/b59dcb995ef901d74a44daf8bfdb4d5698732403.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/430974239" 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/430974239/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ../../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/ipv4.o: ../../../../../../framework/tcpip/src/ipv4.c  .generated_files/84b83696e78696df37e3665dba8ef98d81e5dfc6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/ipv4.o.d" -o ${OBJECTDIR}/_ext/1833714580/ipv4.o ../../../../../../framework/tcpip/src/ipv4.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcp.o: ../../../../../../framework/tcpip/src/tcp.c  .generated_files/beffea986c97e793612318a4a05ed55b9badf69b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcp.o ../../../../../../framework/tcpip/src/tcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/udp.o: ../../../../../../framework/tcpip/src/udp.c  .generated_files/a15581e33d6a77f53a1b598139a0b8d313f9efbb.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/udp.o.d" -o ${OBJECTDIR}/_ext/1833714580/udp.o ../../../../../../framework/tcpip/src/udp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o: ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c  .generated_files/7a2db4257acca7498621939c2dfbe019b4f32bed.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o: ../../../../../../framework/tcpip/src/tcpip_heap_internal.c  .generated_files/d8755318d8692fb09c04e2394220fb2a68cf8d00.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ../../../../../../framework/tcpip/src/tcpip_heap_internal.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/arp.o: ../../../../../../framework/tcpip/src/arp.c  .generated_files/644683205e670dc02d10bd2d8ad6c19d9a7173ee.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/arp.o.d" -o ${OBJECTDIR}/_ext/1833714580/arp.o ../../../../../../framework/tcpip/src/arp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dhcp.o: ../../../../../../framework/tcpip/src/dhcp.c  .generated_files/57960718a8bd9499080a8ee3bda923c19ca31b6e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dhcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/dhcp.o ../../../../../../framework/tcpip/src/dhcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dns.o: ../../../../../../framework/tcpip/src/dns.c  .generated_files/a9fe75fdab4f1e2150b340fa110670a5779db0e4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dns.o.d" -o ${OBJECTDIR}/_ext/1833714580/dns.o ../../../../../../framework/tcpip/src/dns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/nbns.o: ../../../../../../framework/tcpip/src/nbns.c  .generated_files/c9af29cdc63d79e4fcecc24b351faa139fd60112.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/nbns.o.d" -o ${OBJECTDIR}/_ext/1833714580/nbns.o ../../../../../../framework/tcpip/src/nbns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_announce.o: ../../../../../../framework/tcpip/src/tcpip_announce.c  .generated_files/c483a0124b9adea551780ce0c55635a8005d5f99.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ../../../../../../framework/tcpip/src/tcpip_announce.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/593738990/helpers.o: ../../../../../../framework/tcpip/src/common/helpers.c  .generated_files/5affaf48b440895d8d692f778435e12365626a75.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/593738990" 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/593738990/helpers.o.d" -o ${OBJECTDIR}/_ext/593738990/helpers.o ../../../../../../framework/tcpip/src/common/helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/hash_fnv.o: ../../../../../../framework/tcpip/src/hash_fnv.c  .generated_files/5b47ec21761ea32b7cbbed8e22903a6ebf95ed77.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d" -o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ../../../../../../framework/tcpip/src/hash_fnv.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/oahash.o: ../../../../../../framework/tcpip/src/oahash.c  .generated_files/e9ce9232798bce04c8a992a52bd3c2d23945d166.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/oahash.o.d" -o ${OBJECTDIR}/_ext/1833714580/oahash.o ../../../../../../framework/tcpip/src/oahash.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o: ../../../../../../framework/tcpip/src/tcpip_helpers.c  .generated_files/13f70dd82e27df065a5a41ff6c614afa90563cc9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ../../../../../../framework/tcpip/src/tcpip_helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_manager.o: ../../../../../../framework/tcpip/src/tcpip_manager.c  .generated_files/d4ee0ab60ab121c255ca1251fe3bde6f5296cd8b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ../../../../../../framework/tcpip/src/tcpip_manager.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_notify.o: ../../../../../../framework/tcpip/src/tcpip_notify.c  .generated_files/a3b21d66b3a718323b810380f86c639798d1dfa.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ../../../../../../framework/tcpip/src/tcpip_notify.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_packet.o: ../../../../../../framework/tcpip/src/tcpip_packet.c  .generated_files/76de596c1d7ef74ea6b97b81513ff42492d2dade.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ../../../../../../framework/tcpip/src/tcpip_packet.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o: ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_static_buffer_model.c  .generated_files/40a524bde4d52dbc4e73054ab0900ccce4b7b86f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/643353088" 
	@${RM} ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o.d" -o ${OBJECTDIR}/_ext/643353088/drv_i2c_static_buffer_model.o ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_static_buffer_model.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o: ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_mapping.c  .generated_files/bb33397071764c90701768a4bcfaf1e41443e853.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/643353088" 
	@${RM} ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o.d" -o ${OBJECTDIR}/_ext/643353088/drv_i2c_mapping.o ../src/system_config/2312_Config/framework/driver/i2c/src/drv_i2c_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_static.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static.c  .generated_files/24f0a942dbe82b0394d31da007e89de73f22917f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_static.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_static.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_mapping.c  .generated_files/4aa196fa0f52a48fb76ae660c9a057f89a1bada8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_mapping.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_tasks.c  .generated_files/3f22121326dc913ddc1ae6be1fd4d5906a9cda82.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_tasks.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_sys_queue.c  .generated_files/fa3f0540971734c871331acf7e167da584955813.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_sys_queue.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_sys_queue.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o: ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c  .generated_files/3905d6c3b330900de864f66b3e7b4c6a15513e47.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1706047787" 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/1706047787/drv_spi_static_ebm_tasks.o ../src/system_config/2312_Config/framework/driver/spi/static/src/drv_spi_static_ebm_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/832c084ea62a93fcda908138f1df894f3527f1ca.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/e42c9f259aedffd6b858957314519cd83020d171.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/2e0d5058bd0d9de8685ad8a4731b38bca2d31190.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_static.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c  .generated_files/59878626a743ce8522139401f4fb44bba909ad9e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/8a7c3c3e65d5aa1f71bcb405601e9066b8e538b2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o: ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/18b0ce84779dd337570a835d90cfdcfeea415d96.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/15694449" 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c  .generated_files/75a44ac315a82928974bc2648d12fde4e270d53.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/951556dc2c3b3ac878df34de18f830288d433a56.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/604921471/sys_ports_static.o: ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c  .generated_files/76e2b2c56c5c8e4b36bdb7d23ecf37ed2bb41376.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/604921471" 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_init.o: ../src/system_config/2312_Config/system_init.c  .generated_files/77a226176757f55adfd72510039610c3c2f72e87.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_init.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_init.o ../src/system_config/2312_Config/system_init.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_interrupt.o: ../src/system_config/2312_Config/system_interrupt.c  .generated_files/51ed7c4ad4e894d2762e4d38923057ba780fac5a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ../src/system_config/2312_Config/system_interrupt.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_exceptions.o: ../src/system_config/2312_Config/system_exceptions.c  .generated_files/32d7e9c0f234571b071e03a4542b638c505c4e46.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ../src/system_config/2312_Config/system_exceptions.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_tasks.o: ../src/system_config/2312_Config/system_tasks.c  .generated_files/3f051402795eef0133143cc4045eeb2874226ced.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ../src/system_config/2312_Config/system_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../bin/framework/peripheral/PIC32MX795F512H_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512H_peripherals.a      -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=44960,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../bin/framework/peripheral/PIC32MX795F512H_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512H_peripherals.a      -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=44960,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/2312_Config
	${RM} -r dist/2312_Config

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
