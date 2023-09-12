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
SOURCEFILES_QUOTED_IF_SPACED=../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8740.c ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c ../../../../../../framework/driver/usart/src/dynamic/drv_usart.c ../../../../../../framework/driver/usart/src/dynamic/drv_usart_byte_model.c ../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../framework/system/random/src/sys_random.c ../../../../../../framework/system/tmr/src/sys_tmr.c ../../../../../../framework/tcpip/src/ipv4.c ../../../../../../framework/tcpip/src/tcp.c ../../../../../../framework/tcpip/src/udp.c ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c ../../../../../../framework/tcpip/src/tcpip_heap_internal.c ../../../../../../framework/tcpip/src/arp.c ../../../../../../framework/tcpip/src/dhcp.c ../../../../../../framework/tcpip/src/dns.c ../../../../../../framework/tcpip/src/nbns.c ../../../../../../framework/tcpip/src/zero_conf_helper.c ../../../../../../framework/tcpip/src/zero_conf_link_local.c ../../../../../../framework/tcpip/src/tcpip_announce.c ../../../../../../framework/tcpip/src/common/helpers.c ../../../../../../framework/tcpip/src/hash_fnv.c ../../../../../../framework/tcpip/src/oahash.c ../../../../../../framework/tcpip/src/tcpip_helpers.c ../../../../../../framework/tcpip/src/tcpip_helper_c32.S ../../../../../../framework/tcpip/src/tcpip_manager.c ../../../../../../framework/tcpip/src/tcpip_notify.c ../../../../../../framework/tcpip/src/tcpip_packet.c ../src/app.c ../src/phy.c ../src/esp.c ../src/rfid.c ../src/mikroe.c ../src/leds.c ../src/buzzer.c ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c ../src/system_config/2312_Config/bsp/bsp.c ../src/system_config/2312_Config/system_init.c ../src/system_config/2312_Config/system_interrupt.c ../src/system_config/2312_Config/system_exceptions.c ../src/main.c ../src/system_config/2312_Config/system_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o ${OBJECTDIR}/_ext/572279899/drv_miim.o ${OBJECTDIR}/_ext/1927798604/drv_usart.o ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ${OBJECTDIR}/_ext/899838009/sys_random.o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ${OBJECTDIR}/_ext/1833714580/ipv4.o ${OBJECTDIR}/_ext/1833714580/tcp.o ${OBJECTDIR}/_ext/1833714580/udp.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ${OBJECTDIR}/_ext/1833714580/arp.o ${OBJECTDIR}/_ext/1833714580/dhcp.o ${OBJECTDIR}/_ext/1833714580/dns.o ${OBJECTDIR}/_ext/1833714580/nbns.o ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ${OBJECTDIR}/_ext/593738990/helpers.o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ${OBJECTDIR}/_ext/1833714580/oahash.o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/phy.o ${OBJECTDIR}/_ext/1360937237/esp.o ${OBJECTDIR}/_ext/1360937237/rfid.o ${OBJECTDIR}/_ext/1360937237/mikroe.o ${OBJECTDIR}/_ext/1360937237/leds.o ${OBJECTDIR}/_ext/1360937237/buzzer.o ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o ${OBJECTDIR}/_ext/220851720/drv_oc_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ${OBJECTDIR}/_ext/27071976/bsp.o ${OBJECTDIR}/_ext/1708948888/system_init.o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1708948888/system_tasks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o.d ${OBJECTDIR}/_ext/572279899/drv_miim.o.d ${OBJECTDIR}/_ext/1927798604/drv_usart.o.d ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o.d ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d ${OBJECTDIR}/_ext/899838009/sys_random.o.d ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d ${OBJECTDIR}/_ext/1833714580/ipv4.o.d ${OBJECTDIR}/_ext/1833714580/tcp.o.d ${OBJECTDIR}/_ext/1833714580/udp.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d ${OBJECTDIR}/_ext/1833714580/arp.o.d ${OBJECTDIR}/_ext/1833714580/dhcp.o.d ${OBJECTDIR}/_ext/1833714580/dns.o.d ${OBJECTDIR}/_ext/1833714580/nbns.o.d ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d ${OBJECTDIR}/_ext/593738990/helpers.o.d ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d ${OBJECTDIR}/_ext/1833714580/oahash.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/phy.o.d ${OBJECTDIR}/_ext/1360937237/esp.o.d ${OBJECTDIR}/_ext/1360937237/rfid.o.d ${OBJECTDIR}/_ext/1360937237/mikroe.o.d ${OBJECTDIR}/_ext/1360937237/leds.o.d ${OBJECTDIR}/_ext/1360937237/buzzer.o.d ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d ${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d ${OBJECTDIR}/_ext/27071976/bsp.o.d ${OBJECTDIR}/_ext/1708948888/system_init.o.d ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o ${OBJECTDIR}/_ext/572279899/drv_miim.o ${OBJECTDIR}/_ext/1927798604/drv_usart.o ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ${OBJECTDIR}/_ext/899838009/sys_random.o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ${OBJECTDIR}/_ext/1833714580/ipv4.o ${OBJECTDIR}/_ext/1833714580/tcp.o ${OBJECTDIR}/_ext/1833714580/udp.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ${OBJECTDIR}/_ext/1833714580/arp.o ${OBJECTDIR}/_ext/1833714580/dhcp.o ${OBJECTDIR}/_ext/1833714580/dns.o ${OBJECTDIR}/_ext/1833714580/nbns.o ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ${OBJECTDIR}/_ext/593738990/helpers.o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ${OBJECTDIR}/_ext/1833714580/oahash.o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/phy.o ${OBJECTDIR}/_ext/1360937237/esp.o ${OBJECTDIR}/_ext/1360937237/rfid.o ${OBJECTDIR}/_ext/1360937237/mikroe.o ${OBJECTDIR}/_ext/1360937237/leds.o ${OBJECTDIR}/_ext/1360937237/buzzer.o ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o ${OBJECTDIR}/_ext/220851720/drv_oc_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ${OBJECTDIR}/_ext/27071976/bsp.o ${OBJECTDIR}/_ext/1708948888/system_init.o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1708948888/system_tasks.o

# Source Files
SOURCEFILES=../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8740.c ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c ../../../../../../framework/driver/usart/src/dynamic/drv_usart.c ../../../../../../framework/driver/usart/src/dynamic/drv_usart_byte_model.c ../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../framework/system/random/src/sys_random.c ../../../../../../framework/system/tmr/src/sys_tmr.c ../../../../../../framework/tcpip/src/ipv4.c ../../../../../../framework/tcpip/src/tcp.c ../../../../../../framework/tcpip/src/udp.c ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c ../../../../../../framework/tcpip/src/tcpip_heap_internal.c ../../../../../../framework/tcpip/src/arp.c ../../../../../../framework/tcpip/src/dhcp.c ../../../../../../framework/tcpip/src/dns.c ../../../../../../framework/tcpip/src/nbns.c ../../../../../../framework/tcpip/src/zero_conf_helper.c ../../../../../../framework/tcpip/src/zero_conf_link_local.c ../../../../../../framework/tcpip/src/tcpip_announce.c ../../../../../../framework/tcpip/src/common/helpers.c ../../../../../../framework/tcpip/src/hash_fnv.c ../../../../../../framework/tcpip/src/oahash.c ../../../../../../framework/tcpip/src/tcpip_helpers.c ../../../../../../framework/tcpip/src/tcpip_helper_c32.S ../../../../../../framework/tcpip/src/tcpip_manager.c ../../../../../../framework/tcpip/src/tcpip_notify.c ../../../../../../framework/tcpip/src/tcpip_packet.c ../src/app.c ../src/phy.c ../src/esp.c ../src/rfid.c ../src/mikroe.c ../src/leds.c ../src/buzzer.c ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c ../src/system_config/2312_Config/bsp/bsp.c ../src/system_config/2312_Config/system_init.c ../src/system_config/2312_Config/system_interrupt.c ../src/system_config/2312_Config/system_exceptions.c ../src/main.c ../src/system_config/2312_Config/system_tasks.c



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
${OBJECTDIR}/_ext/1764881201/drv_ethmac.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c  .generated_files/ed086df86c89b111fffcce7a298bd5aeea607194.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c  .generated_files/ebbf679dd3484590b30ba8fff1432d6560df10ee.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_ethphy.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c  .generated_files/c0dc2fb5ef08e3337d364c49108a752585f93f80.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8740.c  .generated_files/2056157335ef6e91b9ec8c1f1e5091d9e5b71dcf.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8740.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/572279899/drv_miim.o: ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c  .generated_files/79cdcf93b82ebf7b8466b0e34f499a7c38a5626d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/572279899" 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o.d 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/572279899/drv_miim.o.d" -o ${OBJECTDIR}/_ext/572279899/drv_miim.o ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1927798604/drv_usart.o: ../../../../../../framework/driver/usart/src/dynamic/drv_usart.c  .generated_files/60fc117e3746d668d8bd35b6e1ba31d748110bdc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1927798604" 
	@${RM} ${OBJECTDIR}/_ext/1927798604/drv_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1927798604/drv_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1927798604/drv_usart.o.d" -o ${OBJECTDIR}/_ext/1927798604/drv_usart.o ../../../../../../framework/driver/usart/src/dynamic/drv_usart.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o: ../../../../../../framework/driver/usart/src/dynamic/drv_usart_byte_model.c  .generated_files/745a86cccf86a9f02868a68d7efbdd08934d6bbd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1927798604" 
	@${RM} ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o.d" -o ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o ../../../../../../framework/driver/usart/src/dynamic/drv_usart_byte_model.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/ccd6ff2c6f54b4e7ce599036ca80949715ed5ca2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/899838009/sys_random.o: ../../../../../../framework/system/random/src/sys_random.c  .generated_files/fc120f7ef4df0e29eb58d88993584a01d4eb3a35.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/899838009" 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/899838009/sys_random.o.d" -o ${OBJECTDIR}/_ext/899838009/sys_random.o ../../../../../../framework/system/random/src/sys_random.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/430974239/sys_tmr.o: ../../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/39a76b8cedd0c1774e86f1fe596e0edb745ff286.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/430974239" 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/430974239/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ../../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/ipv4.o: ../../../../../../framework/tcpip/src/ipv4.c  .generated_files/75c7a9f578fcda3a3a479dbb0c06272ee96c763e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/ipv4.o.d" -o ${OBJECTDIR}/_ext/1833714580/ipv4.o ../../../../../../framework/tcpip/src/ipv4.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcp.o: ../../../../../../framework/tcpip/src/tcp.c  .generated_files/2c9925289ecf7a21f4370b9fc6d2aa8f48eaf99f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcp.o ../../../../../../framework/tcpip/src/tcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/udp.o: ../../../../../../framework/tcpip/src/udp.c  .generated_files/4000c40f3a06b5294c797e38af594efbf18712ef.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/udp.o.d" -o ${OBJECTDIR}/_ext/1833714580/udp.o ../../../../../../framework/tcpip/src/udp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o: ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c  .generated_files/9a5be5e6bd38d53b05089058eab3a27f90b5dd21.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o: ../../../../../../framework/tcpip/src/tcpip_heap_internal.c  .generated_files/e1367c70418e1859389e01996b9bb7d388e7c46b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ../../../../../../framework/tcpip/src/tcpip_heap_internal.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/arp.o: ../../../../../../framework/tcpip/src/arp.c  .generated_files/ff5b147595d70f4ae9fd9973a5987148915fafac.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/arp.o.d" -o ${OBJECTDIR}/_ext/1833714580/arp.o ../../../../../../framework/tcpip/src/arp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dhcp.o: ../../../../../../framework/tcpip/src/dhcp.c  .generated_files/cb4512c6fed5162d6fa3c1247d858828f00f2f72.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dhcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/dhcp.o ../../../../../../framework/tcpip/src/dhcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dns.o: ../../../../../../framework/tcpip/src/dns.c  .generated_files/f049ecdc09e99d568589c60b095b61d40b72263f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dns.o.d" -o ${OBJECTDIR}/_ext/1833714580/dns.o ../../../../../../framework/tcpip/src/dns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/nbns.o: ../../../../../../framework/tcpip/src/nbns.c  .generated_files/cf3800f2518baf08dc3c94231d257d7fb0d3d95b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/nbns.o.d" -o ${OBJECTDIR}/_ext/1833714580/nbns.o ../../../../../../framework/tcpip/src/nbns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o: ../../../../../../framework/tcpip/src/zero_conf_helper.c  .generated_files/6802120398aa0ab92ade1bc32d27c6c8f81bde30.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d" -o ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o ../../../../../../framework/tcpip/src/zero_conf_helper.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o: ../../../../../../framework/tcpip/src/zero_conf_link_local.c  .generated_files/cd080f192bee047fe73c9710bc52272276fd8349.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d" -o ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o ../../../../../../framework/tcpip/src/zero_conf_link_local.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_announce.o: ../../../../../../framework/tcpip/src/tcpip_announce.c  .generated_files/c3fa27ce4ae325b20a57fc84e127f7ba717aa140.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ../../../../../../framework/tcpip/src/tcpip_announce.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/593738990/helpers.o: ../../../../../../framework/tcpip/src/common/helpers.c  .generated_files/4d741d4011febe3513eb6271acbba0188b939e4f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/593738990" 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/593738990/helpers.o.d" -o ${OBJECTDIR}/_ext/593738990/helpers.o ../../../../../../framework/tcpip/src/common/helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/hash_fnv.o: ../../../../../../framework/tcpip/src/hash_fnv.c  .generated_files/a6b9b3ed98c5c8cf47c9382f94e98d5f9d04f416.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d" -o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ../../../../../../framework/tcpip/src/hash_fnv.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/oahash.o: ../../../../../../framework/tcpip/src/oahash.c  .generated_files/fbf0a5a9ff192f4d9d39b6234daca9552168b18d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/oahash.o.d" -o ${OBJECTDIR}/_ext/1833714580/oahash.o ../../../../../../framework/tcpip/src/oahash.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o: ../../../../../../framework/tcpip/src/tcpip_helpers.c  .generated_files/53066df2f861b579c4c564f34f41d1746fad972e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ../../../../../../framework/tcpip/src/tcpip_helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_manager.o: ../../../../../../framework/tcpip/src/tcpip_manager.c  .generated_files/b25b289d48a331aeea01c64699a8183121d0f3f2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ../../../../../../framework/tcpip/src/tcpip_manager.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_notify.o: ../../../../../../framework/tcpip/src/tcpip_notify.c  .generated_files/5c4e7b4b6c9c4240325559ad9150637bf9032595.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ../../../../../../framework/tcpip/src/tcpip_notify.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_packet.o: ../../../../../../framework/tcpip/src/tcpip_packet.c  .generated_files/fc452c75bacdf671a41e52d59458ca14cfc7c321.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ../../../../../../framework/tcpip/src/tcpip_packet.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/3cb0afc3040592c47c0ff708ee95b4d2c8dcf1f6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/phy.o: ../src/phy.c  .generated_files/ff43bab47cd1d50286d105738b75741147d7d3ac.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/phy.o.d" -o ${OBJECTDIR}/_ext/1360937237/phy.o ../src/phy.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/esp.o: ../src/esp.c  .generated_files/ecc5385477420b417041ba5e1eb50630b0ff5a7f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/esp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/esp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/esp.o.d" -o ${OBJECTDIR}/_ext/1360937237/esp.o ../src/esp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/rfid.o: ../src/rfid.c  .generated_files/c796814b9cacfa6479a6dce0b625a9b27db10a58.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/rfid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/rfid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/rfid.o.d" -o ${OBJECTDIR}/_ext/1360937237/rfid.o ../src/rfid.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/mikroe.o: ../src/mikroe.c  .generated_files/1d476a39a27e2aeffa9a268cef76ccce1be884da.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mikroe.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mikroe.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/mikroe.o.d" -o ${OBJECTDIR}/_ext/1360937237/mikroe.o ../src/mikroe.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/leds.o: ../src/leds.c  .generated_files/42a5f1d2dd0c30ee74e137620140d8d7c01dbe70.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/leds.o.d" -o ${OBJECTDIR}/_ext/1360937237/leds.o ../src/leds.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/buzzer.o: ../src/buzzer.c  .generated_files/4dfd6876ddefb027ab328e129bc0f4ffa8a88335.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/buzzer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/buzzer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/buzzer.o.d" -o ${OBJECTDIR}/_ext/1360937237/buzzer.o ../src/buzzer.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o: ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c  .generated_files/c9ccbedeba1dd0868bbb6dfd1151f68c2244db3e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/220851720" 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d" -o ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/220851720/drv_oc_static.o: ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c  .generated_files/ec6007b755d1d4446bd01b928007aa16887a6209.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/220851720" 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d" -o ${OBJECTDIR}/_ext/220851720/drv_oc_static.o ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/e51eaf24bd9493146715ba95873b4b9079572bbb.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/53b236270f35058c6f08fbd88c64c704e6a38574.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o: ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/39c2e70a467011a19e2f3bc1179ad1b18c23a45a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/15694449" 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c  .generated_files/f3759aec52dbc5f7c528603f5c5161ec330ecd51.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/ac3fd8cf2af695e21c276b7dddfb12260d7a44b9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/604921471/sys_ports_static.o: ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c  .generated_files/ba347eaa38146903001332fc27e369718d7e1b5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/604921471" 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/27071976/bsp.o: ../src/system_config/2312_Config/bsp/bsp.c  .generated_files/7ef44c47c9251ccd82852f9cfc5e0a849939863b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/27071976" 
	@${RM} ${OBJECTDIR}/_ext/27071976/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/27071976/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/27071976/bsp.o.d" -o ${OBJECTDIR}/_ext/27071976/bsp.o ../src/system_config/2312_Config/bsp/bsp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_init.o: ../src/system_config/2312_Config/system_init.c  .generated_files/1d3f2173be478ae3ff858113c1ec95e2df640642.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_init.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_init.o ../src/system_config/2312_Config/system_init.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_interrupt.o: ../src/system_config/2312_Config/system_interrupt.c  .generated_files/f4626bb4f64dbd0c776ca0a555d1fb431c61d611.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ../src/system_config/2312_Config/system_interrupt.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_exceptions.o: ../src/system_config/2312_Config/system_exceptions.c  .generated_files/52a3115d2a4bfb19277653ed53beccf25f565bd8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ../src/system_config/2312_Config/system_exceptions.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/d4cd0b313de984b284d0e7ace7722fe39a3b5e18.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_tasks.o: ../src/system_config/2312_Config/system_tasks.c  .generated_files/457856be15c06e5638d1b2995a9003f8e6ce33c9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ../src/system_config/2312_Config/system_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1764881201/drv_ethmac.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c  .generated_files/f955867025c12fb83ea8cb1e4581d023d81c7017.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c  .generated_files/d35472a7360d5ec6620e6cc98a23a678816c9cc8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_ethphy.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c  .generated_files/2ab9fef1d2f9e6f473a1bde6aa82b278d4eb2656.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8740.c  .generated_files/11779ca5b4bc5d8db6491b786ffb311f34c263dd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8740.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8740.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/572279899/drv_miim.o: ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c  .generated_files/b994073463583e684e8fe343565ec98bcca4c88d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/572279899" 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o.d 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/572279899/drv_miim.o.d" -o ${OBJECTDIR}/_ext/572279899/drv_miim.o ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1927798604/drv_usart.o: ../../../../../../framework/driver/usart/src/dynamic/drv_usart.c  .generated_files/d1a3d44d5509f6e8d9df91dd06a818df99aab17a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1927798604" 
	@${RM} ${OBJECTDIR}/_ext/1927798604/drv_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1927798604/drv_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1927798604/drv_usart.o.d" -o ${OBJECTDIR}/_ext/1927798604/drv_usart.o ../../../../../../framework/driver/usart/src/dynamic/drv_usart.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o: ../../../../../../framework/driver/usart/src/dynamic/drv_usart_byte_model.c  .generated_files/ccbc7ebe8a08d70dc51bb18a3e57acf5bdd3c88c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1927798604" 
	@${RM} ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o.d" -o ${OBJECTDIR}/_ext/1927798604/drv_usart_byte_model.o ../../../../../../framework/driver/usart/src/dynamic/drv_usart_byte_model.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/8332401446d726076d34e00f9063e63783e91fd9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/899838009/sys_random.o: ../../../../../../framework/system/random/src/sys_random.c  .generated_files/82a50bbf41b044f855c1d42295abcd58d8ca7c04.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/899838009" 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/899838009/sys_random.o.d" -o ${OBJECTDIR}/_ext/899838009/sys_random.o ../../../../../../framework/system/random/src/sys_random.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/430974239/sys_tmr.o: ../../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/5a6d57fbd6fbeb1836a8317ee4f3137752a35d0b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/430974239" 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/430974239/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ../../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/ipv4.o: ../../../../../../framework/tcpip/src/ipv4.c  .generated_files/b064dc1f48d0bfa7cd24b088bf662494d7a5dd0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/ipv4.o.d" -o ${OBJECTDIR}/_ext/1833714580/ipv4.o ../../../../../../framework/tcpip/src/ipv4.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcp.o: ../../../../../../framework/tcpip/src/tcp.c  .generated_files/2b3af7058a268bf0640bc5c73c09b41c80a65c59.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcp.o ../../../../../../framework/tcpip/src/tcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/udp.o: ../../../../../../framework/tcpip/src/udp.c  .generated_files/c71e6cc2f851053cbeca46a14164f32f1796640c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/udp.o.d" -o ${OBJECTDIR}/_ext/1833714580/udp.o ../../../../../../framework/tcpip/src/udp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o: ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c  .generated_files/2a0f550e898de230d1d929f0811a6d3f4e942b83.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o: ../../../../../../framework/tcpip/src/tcpip_heap_internal.c  .generated_files/2154301fa521595c98fd38aaf0df87ebed610fc9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ../../../../../../framework/tcpip/src/tcpip_heap_internal.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/arp.o: ../../../../../../framework/tcpip/src/arp.c  .generated_files/39f43bebce2395f52eccf98347f4859205e7dca5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/arp.o.d" -o ${OBJECTDIR}/_ext/1833714580/arp.o ../../../../../../framework/tcpip/src/arp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dhcp.o: ../../../../../../framework/tcpip/src/dhcp.c  .generated_files/e6e6ef38bdd4fb064c55289ef4b35284e426223f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dhcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/dhcp.o ../../../../../../framework/tcpip/src/dhcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dns.o: ../../../../../../framework/tcpip/src/dns.c  .generated_files/707941059e26ee9264f03911094613c7e056959.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dns.o.d" -o ${OBJECTDIR}/_ext/1833714580/dns.o ../../../../../../framework/tcpip/src/dns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/nbns.o: ../../../../../../framework/tcpip/src/nbns.c  .generated_files/1ef172a11930f710f80ff2dd40896b26aec9add9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/nbns.o.d" -o ${OBJECTDIR}/_ext/1833714580/nbns.o ../../../../../../framework/tcpip/src/nbns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o: ../../../../../../framework/tcpip/src/zero_conf_helper.c  .generated_files/8e7067f911b57f36b36b2c6e7e1232d439226d28.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d" -o ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o ../../../../../../framework/tcpip/src/zero_conf_helper.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o: ../../../../../../framework/tcpip/src/zero_conf_link_local.c  .generated_files/a9a860aa400cbbe0b68658f562d426627ae95cb9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d" -o ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o ../../../../../../framework/tcpip/src/zero_conf_link_local.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_announce.o: ../../../../../../framework/tcpip/src/tcpip_announce.c  .generated_files/24eae93243bd16ec0e8a22d2062c71fb73cf74af.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ../../../../../../framework/tcpip/src/tcpip_announce.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/593738990/helpers.o: ../../../../../../framework/tcpip/src/common/helpers.c  .generated_files/95ff46890049b07d2c0b6663c1e3e21f364c6e7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/593738990" 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/593738990/helpers.o.d" -o ${OBJECTDIR}/_ext/593738990/helpers.o ../../../../../../framework/tcpip/src/common/helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/hash_fnv.o: ../../../../../../framework/tcpip/src/hash_fnv.c  .generated_files/65848b88c0ac02fe2d8aeebe3b0ea863d560c50d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d" -o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ../../../../../../framework/tcpip/src/hash_fnv.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/oahash.o: ../../../../../../framework/tcpip/src/oahash.c  .generated_files/723b30ab0adae165e1b752e7d68b11c42dfa9e8e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/oahash.o.d" -o ${OBJECTDIR}/_ext/1833714580/oahash.o ../../../../../../framework/tcpip/src/oahash.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o: ../../../../../../framework/tcpip/src/tcpip_helpers.c  .generated_files/a0684bfdc3adf444b2756648b65a22448252453b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ../../../../../../framework/tcpip/src/tcpip_helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_manager.o: ../../../../../../framework/tcpip/src/tcpip_manager.c  .generated_files/e5e11de4196ac94cfb936c2c5d8a9a24dc94434c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ../../../../../../framework/tcpip/src/tcpip_manager.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_notify.o: ../../../../../../framework/tcpip/src/tcpip_notify.c  .generated_files/d2da8c20d2494e771b3b415e082212b12f3f7eb4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ../../../../../../framework/tcpip/src/tcpip_notify.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_packet.o: ../../../../../../framework/tcpip/src/tcpip_packet.c  .generated_files/c249a35ba38f8db68ad1536636fb7ad25ba2e154.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ../../../../../../framework/tcpip/src/tcpip_packet.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/b0d69b5046229bf54c8649175d4fe6a3a670e8be.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/phy.o: ../src/phy.c  .generated_files/9f9c1e57a1687de42a48e87023b644fc5814632f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/phy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/phy.o.d" -o ${OBJECTDIR}/_ext/1360937237/phy.o ../src/phy.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/esp.o: ../src/esp.c  .generated_files/bfdfcc749aec7d60dfb1fd6b4972c1516a88e8fe.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/esp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/esp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/esp.o.d" -o ${OBJECTDIR}/_ext/1360937237/esp.o ../src/esp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/rfid.o: ../src/rfid.c  .generated_files/ddf38f5d8c64f355fbeae97428a605473528f5c1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/rfid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/rfid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/rfid.o.d" -o ${OBJECTDIR}/_ext/1360937237/rfid.o ../src/rfid.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/mikroe.o: ../src/mikroe.c  .generated_files/f80d79cfd3369daed34a99f5fd457366017ec42b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mikroe.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/mikroe.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/mikroe.o.d" -o ${OBJECTDIR}/_ext/1360937237/mikroe.o ../src/mikroe.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/leds.o: ../src/leds.c  .generated_files/4f123ef094e1ea6e8869eb68b834e771c3ff7f1b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/leds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/leds.o.d" -o ${OBJECTDIR}/_ext/1360937237/leds.o ../src/leds.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/buzzer.o: ../src/buzzer.c  .generated_files/da031a9db1d512276338805ef601dc17dd0b8f80.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/buzzer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/buzzer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/buzzer.o.d" -o ${OBJECTDIR}/_ext/1360937237/buzzer.o ../src/buzzer.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o: ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c  .generated_files/9d9c59ced4cb1fe1aa0d482350552ae1b28505f0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/220851720" 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d" -o ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/220851720/drv_oc_static.o: ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c  .generated_files/64cb656c7b57d7edae39f3839051b16d8c47ec36.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/220851720" 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d" -o ${OBJECTDIR}/_ext/220851720/drv_oc_static.o ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/ed1aaeac68d56f03af4bfe037adb90e0f4a40fd9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/202ab1387e77d4db2260018640a04ecb3c814dc1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o: ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/565576e3a8b72a826d9942ff0838ed2d6906e92c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/15694449" 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c  .generated_files/17d102fa2c09a2788fc4771a7f7eae1461a76d8e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/15f80f0a9d6bba68a21cda5424e54813501c196c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/604921471/sys_ports_static.o: ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c  .generated_files/f46dac548c85df4017d14954e17d632f96a8f12b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/604921471" 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/27071976/bsp.o: ../src/system_config/2312_Config/bsp/bsp.c  .generated_files/2cd20166ce8f65bbfd2ca33329a874109b0d060d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/27071976" 
	@${RM} ${OBJECTDIR}/_ext/27071976/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/27071976/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/27071976/bsp.o.d" -o ${OBJECTDIR}/_ext/27071976/bsp.o ../src/system_config/2312_Config/bsp/bsp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_init.o: ../src/system_config/2312_Config/system_init.c  .generated_files/a5c7cdae28201d8694dc187cd8ad103061ed1dd5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_init.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_init.o ../src/system_config/2312_Config/system_init.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_interrupt.o: ../src/system_config/2312_Config/system_interrupt.c  .generated_files/5321235e914e77a741e7b1d1ac54468c2ff49f04.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ../src/system_config/2312_Config/system_interrupt.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_exceptions.o: ../src/system_config/2312_Config/system_exceptions.c  .generated_files/47d98c532488a04fa727ded2a270df7c46635772.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ../src/system_config/2312_Config/system_exceptions.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/9afd80da4e46b46414acc150900081bf1ec6927f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_tasks.o: ../src/system_config/2312_Config/system_tasks.c  .generated_files/1e799a53f81c05b99131fd3da06cdde18994d91a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -I"../src/system_config/2312_Config/bsp" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ../src/system_config/2312_Config/system_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
