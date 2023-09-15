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
SOURCEFILES_QUOTED_IF_SPACED=../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c ../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../framework/system/random/src/sys_random.c ../../../../../../framework/system/tmr/src/sys_tmr.c ../../../../../../framework/tcpip/src/ipv4.c ../../../../../../framework/tcpip/src/tcp.c ../../../../../../framework/tcpip/src/udp.c ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c ../../../../../../framework/tcpip/src/tcpip_heap_internal.c ../../../../../../framework/tcpip/src/arp.c ../../../../../../framework/tcpip/src/dhcp.c ../../../../../../framework/tcpip/src/dns.c ../../../../../../framework/tcpip/src/icmp.c ../../../../../../framework/tcpip/src/nbns.c ../../../../../../framework/tcpip/src/zero_conf_helper.c ../../../../../../framework/tcpip/src/zero_conf_link_local.c ../../../../../../framework/tcpip/src/tcpip_announce.c ../../../../../../framework/tcpip/src/common/helpers.c ../../../../../../framework/tcpip/src/hash_fnv.c ../../../../../../framework/tcpip/src/oahash.c ../../../../../../framework/tcpip/src/tcpip_helpers.c ../../../../../../framework/tcpip/src/tcpip_helper_c32.S ../../../../../../framework/tcpip/src/tcpip_manager.c ../../../../../../framework/tcpip/src/tcpip_notify.c ../../../../../../framework/tcpip/src/tcpip_packet.c ../src/eth.c ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c ../src/system_config/2312_Config/system_init.c ../src/system_config/2312_Config/system_interrupt.c ../src/system_config/2312_Config/system_exceptions.c ../src/main.c ../src/system_config/2312_Config/system_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o ${OBJECTDIR}/_ext/572279899/drv_miim.o ${OBJECTDIR}/_ext/1152366776/drv_tmr.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ${OBJECTDIR}/_ext/899838009/sys_random.o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ${OBJECTDIR}/_ext/1833714580/ipv4.o ${OBJECTDIR}/_ext/1833714580/tcp.o ${OBJECTDIR}/_ext/1833714580/udp.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ${OBJECTDIR}/_ext/1833714580/arp.o ${OBJECTDIR}/_ext/1833714580/dhcp.o ${OBJECTDIR}/_ext/1833714580/dns.o ${OBJECTDIR}/_ext/1833714580/icmp.o ${OBJECTDIR}/_ext/1833714580/nbns.o ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ${OBJECTDIR}/_ext/593738990/helpers.o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ${OBJECTDIR}/_ext/1833714580/oahash.o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ${OBJECTDIR}/_ext/1360937237/eth.o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ${OBJECTDIR}/_ext/1708948888/system_init.o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1708948888/system_tasks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d ${OBJECTDIR}/_ext/572279899/drv_miim.o.d ${OBJECTDIR}/_ext/1152366776/drv_tmr.o.d ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d ${OBJECTDIR}/_ext/899838009/sys_random.o.d ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d ${OBJECTDIR}/_ext/1833714580/ipv4.o.d ${OBJECTDIR}/_ext/1833714580/tcp.o.d ${OBJECTDIR}/_ext/1833714580/udp.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d ${OBJECTDIR}/_ext/1833714580/arp.o.d ${OBJECTDIR}/_ext/1833714580/dhcp.o.d ${OBJECTDIR}/_ext/1833714580/dns.o.d ${OBJECTDIR}/_ext/1833714580/icmp.o.d ${OBJECTDIR}/_ext/1833714580/nbns.o.d ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d ${OBJECTDIR}/_ext/593738990/helpers.o.d ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d ${OBJECTDIR}/_ext/1833714580/oahash.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d ${OBJECTDIR}/_ext/1360937237/eth.o.d ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d ${OBJECTDIR}/_ext/1708948888/system_init.o.d ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o ${OBJECTDIR}/_ext/572279899/drv_miim.o ${OBJECTDIR}/_ext/1152366776/drv_tmr.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ${OBJECTDIR}/_ext/899838009/sys_random.o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ${OBJECTDIR}/_ext/1833714580/ipv4.o ${OBJECTDIR}/_ext/1833714580/tcp.o ${OBJECTDIR}/_ext/1833714580/udp.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ${OBJECTDIR}/_ext/1833714580/arp.o ${OBJECTDIR}/_ext/1833714580/dhcp.o ${OBJECTDIR}/_ext/1833714580/dns.o ${OBJECTDIR}/_ext/1833714580/icmp.o ${OBJECTDIR}/_ext/1833714580/nbns.o ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ${OBJECTDIR}/_ext/593738990/helpers.o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ${OBJECTDIR}/_ext/1833714580/oahash.o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ${OBJECTDIR}/_ext/1833714580/tcpip_helper_c32.o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ${OBJECTDIR}/_ext/1360937237/eth.o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ${OBJECTDIR}/_ext/1708948888/system_init.o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1708948888/system_tasks.o

# Source Files
SOURCEFILES=../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c ../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c ../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../framework/system/random/src/sys_random.c ../../../../../../framework/system/tmr/src/sys_tmr.c ../../../../../../framework/tcpip/src/ipv4.c ../../../../../../framework/tcpip/src/tcp.c ../../../../../../framework/tcpip/src/udp.c ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c ../../../../../../framework/tcpip/src/tcpip_heap_internal.c ../../../../../../framework/tcpip/src/arp.c ../../../../../../framework/tcpip/src/dhcp.c ../../../../../../framework/tcpip/src/dns.c ../../../../../../framework/tcpip/src/icmp.c ../../../../../../framework/tcpip/src/nbns.c ../../../../../../framework/tcpip/src/zero_conf_helper.c ../../../../../../framework/tcpip/src/zero_conf_link_local.c ../../../../../../framework/tcpip/src/tcpip_announce.c ../../../../../../framework/tcpip/src/common/helpers.c ../../../../../../framework/tcpip/src/hash_fnv.c ../../../../../../framework/tcpip/src/oahash.c ../../../../../../framework/tcpip/src/tcpip_helpers.c ../../../../../../framework/tcpip/src/tcpip_helper_c32.S ../../../../../../framework/tcpip/src/tcpip_manager.c ../../../../../../framework/tcpip/src/tcpip_notify.c ../../../../../../framework/tcpip/src/tcpip_packet.c ../src/eth.c ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c ../src/system_config/2312_Config/system_init.c ../src/system_config/2312_Config/system_interrupt.c ../src/system_config/2312_Config/system_exceptions.c ../src/main.c ../src/system_config/2312_Config/system_tasks.c



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
${OBJECTDIR}/_ext/1764881201/drv_ethmac.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c  .generated_files/99e7d086251c05ca9791db6ba8fa96db20c17038.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c  .generated_files/a4d09d9c2ed6deb1a7f3cb38168dbddeead8ba6c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_ethphy.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c  .generated_files/8007589775411b1d5d34630eebdcb354655c4583.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c  .generated_files/e6b6fadc6f86601fcccfd00ce542e67bae95caf7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/572279899/drv_miim.o: ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c  .generated_files/295490a682df7d4f92b69a4f2c68d4e6b0b1d6ad.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/572279899" 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o.d 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/572279899/drv_miim.o.d" -o ${OBJECTDIR}/_ext/572279899/drv_miim.o ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1152366776/drv_tmr.o: ../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  .generated_files/ee6318cdacfaaef02cd2ab13c97e22dc8cd8650d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1152366776" 
	@${RM} ${OBJECTDIR}/_ext/1152366776/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1152366776/drv_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1152366776/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/1152366776/drv_tmr.o ../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/d9deaecce0c065a3725d4cd8209e2e05c6de5285.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/899838009/sys_random.o: ../../../../../../framework/system/random/src/sys_random.c  .generated_files/3598f5316bbe6487451121325cb1828bc85ef5d7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/899838009" 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/899838009/sys_random.o.d" -o ${OBJECTDIR}/_ext/899838009/sys_random.o ../../../../../../framework/system/random/src/sys_random.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/430974239/sys_tmr.o: ../../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/f76ca02e679d6cb5d46ea1208800d0dd7dcc975.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/430974239" 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/430974239/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ../../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/ipv4.o: ../../../../../../framework/tcpip/src/ipv4.c  .generated_files/7931a10d6c448ce755f3c3b9bb762338f874a130.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/ipv4.o.d" -o ${OBJECTDIR}/_ext/1833714580/ipv4.o ../../../../../../framework/tcpip/src/ipv4.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcp.o: ../../../../../../framework/tcpip/src/tcp.c  .generated_files/b95c10485ea1d564e6103c313b48f945d5ee4b2a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcp.o ../../../../../../framework/tcpip/src/tcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/udp.o: ../../../../../../framework/tcpip/src/udp.c  .generated_files/1c720d4c384be3cc2df746fd95a30ceb25b2f040.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/udp.o.d" -o ${OBJECTDIR}/_ext/1833714580/udp.o ../../../../../../framework/tcpip/src/udp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o: ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c  .generated_files/26beda2f9e5c06de907574626d1dd6c921a5fa20.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o: ../../../../../../framework/tcpip/src/tcpip_heap_internal.c  .generated_files/771cfb228bc6195e8a871b4831527c1952262656.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ../../../../../../framework/tcpip/src/tcpip_heap_internal.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/arp.o: ../../../../../../framework/tcpip/src/arp.c  .generated_files/1fad0ddb389163c330eb7e9ac81a739c7b77f26f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/arp.o.d" -o ${OBJECTDIR}/_ext/1833714580/arp.o ../../../../../../framework/tcpip/src/arp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dhcp.o: ../../../../../../framework/tcpip/src/dhcp.c  .generated_files/684b185a88bcc7f2a3c957af22b10fd2a595b01c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dhcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/dhcp.o ../../../../../../framework/tcpip/src/dhcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dns.o: ../../../../../../framework/tcpip/src/dns.c  .generated_files/3214d690fb46d76ec959a276bfa7f90b41900244.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dns.o.d" -o ${OBJECTDIR}/_ext/1833714580/dns.o ../../../../../../framework/tcpip/src/dns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/icmp.o: ../../../../../../framework/tcpip/src/icmp.c  .generated_files/d999196683b4f609f80fd7c0c79c79225019123f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/icmp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/icmp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/icmp.o.d" -o ${OBJECTDIR}/_ext/1833714580/icmp.o ../../../../../../framework/tcpip/src/icmp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/nbns.o: ../../../../../../framework/tcpip/src/nbns.c  .generated_files/7f13c6850f3f04c94cafa023907b8a9a08724d33.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/nbns.o.d" -o ${OBJECTDIR}/_ext/1833714580/nbns.o ../../../../../../framework/tcpip/src/nbns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o: ../../../../../../framework/tcpip/src/zero_conf_helper.c  .generated_files/715debf89e1e495665f7b6b9048da3707a7d6b4d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d" -o ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o ../../../../../../framework/tcpip/src/zero_conf_helper.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o: ../../../../../../framework/tcpip/src/zero_conf_link_local.c  .generated_files/54f1029ac83b25cdea41bf4a34734ceb5e6b3865.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d" -o ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o ../../../../../../framework/tcpip/src/zero_conf_link_local.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_announce.o: ../../../../../../framework/tcpip/src/tcpip_announce.c  .generated_files/2e37aac87a794ab0bce878c817fb34e69f6470e0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ../../../../../../framework/tcpip/src/tcpip_announce.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/593738990/helpers.o: ../../../../../../framework/tcpip/src/common/helpers.c  .generated_files/14cdd408a1c8fc0caf4f7272e1377f26024fdce8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/593738990" 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/593738990/helpers.o.d" -o ${OBJECTDIR}/_ext/593738990/helpers.o ../../../../../../framework/tcpip/src/common/helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/hash_fnv.o: ../../../../../../framework/tcpip/src/hash_fnv.c  .generated_files/3f452b06b3631d54fc44f24292bf726078195318.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d" -o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ../../../../../../framework/tcpip/src/hash_fnv.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/oahash.o: ../../../../../../framework/tcpip/src/oahash.c  .generated_files/60a1cc5f7de835114ee6df40a2beabd63b961396.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/oahash.o.d" -o ${OBJECTDIR}/_ext/1833714580/oahash.o ../../../../../../framework/tcpip/src/oahash.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o: ../../../../../../framework/tcpip/src/tcpip_helpers.c  .generated_files/4e6aa6095e4d4e8e0b907b9b5de8a438d57e8bb1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ../../../../../../framework/tcpip/src/tcpip_helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_manager.o: ../../../../../../framework/tcpip/src/tcpip_manager.c  .generated_files/8261fcc6c7f9b3c42af271391fe7e96a1a3a9f0c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ../../../../../../framework/tcpip/src/tcpip_manager.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_notify.o: ../../../../../../framework/tcpip/src/tcpip_notify.c  .generated_files/e981751dc598d84aef0d7b03182e4fef93a75ab7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ../../../../../../framework/tcpip/src/tcpip_notify.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_packet.o: ../../../../../../framework/tcpip/src/tcpip_packet.c  .generated_files/6da3c9a704e1f1773f107d87b61966c873fde0f8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ../../../../../../framework/tcpip/src/tcpip_packet.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/eth.o: ../src/eth.c  .generated_files/e0aad3722686a7e3c943d0f1f9371d24c0706be.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/eth.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/eth.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/eth.o.d" -o ${OBJECTDIR}/_ext/1360937237/eth.o ../src/eth.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o: ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/29a9e16a7e9fe549fef78df66f6abe2108f4475e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/15694449" 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c  .generated_files/9c634bb308b85ba14db0de09615dbf0020e14995.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/12bdce611a899ff48fac4a24afbc12572f375b54.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/604921471/sys_ports_static.o: ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c  .generated_files/1892ccf5b0e8887e30515d089d41357fbf40ca41.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/604921471" 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_init.o: ../src/system_config/2312_Config/system_init.c  .generated_files/4a177e2edb4a5e664aa5aa47709884471f228d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_init.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_init.o ../src/system_config/2312_Config/system_init.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_interrupt.o: ../src/system_config/2312_Config/system_interrupt.c  .generated_files/d862c845f991f4490a05aedd2f38f77569bb11f7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ../src/system_config/2312_Config/system_interrupt.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_exceptions.o: ../src/system_config/2312_Config/system_exceptions.c  .generated_files/839c316d96b921ab70cc42183bdb4f6ce18df3bc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ../src/system_config/2312_Config/system_exceptions.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/e29deaf724ccd7609db29c0f73434b5b6a1060e8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_tasks.o: ../src/system_config/2312_Config/system_tasks.c  .generated_files/6b3426bcc3ecdb876151915e15c89a0016a0fef7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ../src/system_config/2312_Config/system_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1764881201/drv_ethmac.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c  .generated_files/f4ebcfc03e16cde71d5f54bf9e0acb7eb2855dc6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o: ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c  .generated_files/d3c12ea9448c5fa5962193bdc309a809e62b4f73.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1764881201" 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o.d" -o ${OBJECTDIR}/_ext/1764881201/drv_ethmac_lib.o ../../../../../../framework/driver/ethmac/src/dynamic/drv_ethmac_lib.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_ethphy.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c  .generated_files/b6b4d5adb133bf0cf2fd1502c1fc5ccf5363288f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_ethphy.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_ethphy.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_ethphy.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_ethphy.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o: ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c  .generated_files/74ebce4f7d203cf0275d117699532bc42c537430.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/588727395" 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d 
	@${RM} ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o.d" -o ${OBJECTDIR}/_ext/588727395/drv_extphy_smsc8720.o ../../../../../../framework/driver/ethphy/src/dynamic/drv_extphy_smsc8720.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/572279899/drv_miim.o: ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c  .generated_files/5cbe5020cd82e61635b23a7454d9c6d0ff1ddcf2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/572279899" 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o.d 
	@${RM} ${OBJECTDIR}/_ext/572279899/drv_miim.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/572279899/drv_miim.o.d" -o ${OBJECTDIR}/_ext/572279899/drv_miim.o ../../../../../../framework/driver/miim/src/dynamic/drv_miim.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1152366776/drv_tmr.o: ../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c  .generated_files/27f98ad5812932deab556251125eb51302cb94ad.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1152366776" 
	@${RM} ${OBJECTDIR}/_ext/1152366776/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1152366776/drv_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1152366776/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/1152366776/drv_tmr.o ../../../../../../framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/5b502f51d8971c53952722f0d4b5cc37ec4e73d8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/899838009/sys_random.o: ../../../../../../framework/system/random/src/sys_random.c  .generated_files/b3be6b9e60fbe68dd0fea6a824dea77ecd68a170.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/899838009" 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/899838009/sys_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/899838009/sys_random.o.d" -o ${OBJECTDIR}/_ext/899838009/sys_random.o ../../../../../../framework/system/random/src/sys_random.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/430974239/sys_tmr.o: ../../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/29341ba816c4d4d68777273a2579baf8140077bf.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/430974239" 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/430974239/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/430974239/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/430974239/sys_tmr.o ../../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/ipv4.o: ../../../../../../framework/tcpip/src/ipv4.c  .generated_files/f8a4d79eed50c94230d9ba105a164b7b43df5ef3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/ipv4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/ipv4.o.d" -o ${OBJECTDIR}/_ext/1833714580/ipv4.o ../../../../../../framework/tcpip/src/ipv4.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcp.o: ../../../../../../framework/tcpip/src/tcp.c  .generated_files/2b46b48661f187ce51eb45742b20bd7a27a59ccb.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcp.o ../../../../../../framework/tcpip/src/tcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/udp.o: ../../../../../../framework/tcpip/src/udp.c  .generated_files/887d37a78eb6bdcfaefaf3661f579805ee72b214.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/udp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/udp.o.d" -o ${OBJECTDIR}/_ext/1833714580/udp.o ../../../../../../framework/tcpip/src/udp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o: ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c  .generated_files/b539150b8649e3f1acfe8aa0260a19adf05b6424.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_alloc.o ../../../../../../framework/tcpip/src/tcpip_heap_alloc.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o: ../../../../../../framework/tcpip/src/tcpip_heap_internal.c  .generated_files/d5a8d03d0465e1a5199a50ed3245039783903c23.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_heap_internal.o ../../../../../../framework/tcpip/src/tcpip_heap_internal.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/arp.o: ../../../../../../framework/tcpip/src/arp.c  .generated_files/496d5cde47df644c5d2471467f403ee564c0009e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/arp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/arp.o.d" -o ${OBJECTDIR}/_ext/1833714580/arp.o ../../../../../../framework/tcpip/src/arp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dhcp.o: ../../../../../../framework/tcpip/src/dhcp.c  .generated_files/2f6312e6dbf067194c0712336c83afe927bff01f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dhcp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dhcp.o.d" -o ${OBJECTDIR}/_ext/1833714580/dhcp.o ../../../../../../framework/tcpip/src/dhcp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/dns.o: ../../../../../../framework/tcpip/src/dns.c  .generated_files/22d9c2f0b0cce0cdbc54993eb7680629b57ca23a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/dns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/dns.o.d" -o ${OBJECTDIR}/_ext/1833714580/dns.o ../../../../../../framework/tcpip/src/dns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/icmp.o: ../../../../../../framework/tcpip/src/icmp.c  .generated_files/842a6d39b763c6fe81cd5a513f939b37cda55557.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/icmp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/icmp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/icmp.o.d" -o ${OBJECTDIR}/_ext/1833714580/icmp.o ../../../../../../framework/tcpip/src/icmp.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/nbns.o: ../../../../../../framework/tcpip/src/nbns.c  .generated_files/1918fdecb2f5520b1c8f1e6c2216459092169b1e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/nbns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/nbns.o.d" -o ${OBJECTDIR}/_ext/1833714580/nbns.o ../../../../../../framework/tcpip/src/nbns.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o: ../../../../../../framework/tcpip/src/zero_conf_helper.c  .generated_files/ef34a013beac94b488084be96adba9ac7e42ed41.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o.d" -o ${OBJECTDIR}/_ext/1833714580/zero_conf_helper.o ../../../../../../framework/tcpip/src/zero_conf_helper.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o: ../../../../../../framework/tcpip/src/zero_conf_link_local.c  .generated_files/c28e7b00d9a5377e976a3753b7e0c419bda6cf16.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o.d" -o ${OBJECTDIR}/_ext/1833714580/zero_conf_link_local.o ../../../../../../framework/tcpip/src/zero_conf_link_local.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_announce.o: ../../../../../../framework/tcpip/src/tcpip_announce.c  .generated_files/7c401f28aeb52f54c5fe1f447f7dc3f653553948.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_announce.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_announce.o ../../../../../../framework/tcpip/src/tcpip_announce.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/593738990/helpers.o: ../../../../../../framework/tcpip/src/common/helpers.c  .generated_files/b940cd0f04a09cfcd6cd8eef42e1e284c22ebe18.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/593738990" 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/593738990/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/593738990/helpers.o.d" -o ${OBJECTDIR}/_ext/593738990/helpers.o ../../../../../../framework/tcpip/src/common/helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/hash_fnv.o: ../../../../../../framework/tcpip/src/hash_fnv.c  .generated_files/c4cc3f74b6c599c111f8789f6cf04e7f338d6fd7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/hash_fnv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/hash_fnv.o.d" -o ${OBJECTDIR}/_ext/1833714580/hash_fnv.o ../../../../../../framework/tcpip/src/hash_fnv.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/oahash.o: ../../../../../../framework/tcpip/src/oahash.c  .generated_files/856f3d253425ceda7876a8cffcd8375f3e8ad57e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/oahash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/oahash.o.d" -o ${OBJECTDIR}/_ext/1833714580/oahash.o ../../../../../../framework/tcpip/src/oahash.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o: ../../../../../../framework/tcpip/src/tcpip_helpers.c  .generated_files/a27f24c07eadfb69ebd667c72fe388df9e118742.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_helpers.o ../../../../../../framework/tcpip/src/tcpip_helpers.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_manager.o: ../../../../../../framework/tcpip/src/tcpip_manager.c  .generated_files/398d73f8b676b05d1b77fba485a2b70387783217.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_manager.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_manager.o ../../../../../../framework/tcpip/src/tcpip_manager.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_notify.o: ../../../../../../framework/tcpip/src/tcpip_notify.c  .generated_files/4fdf5f0ac0759d120c42cc2925561f3194d02db3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_notify.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_notify.o ../../../../../../framework/tcpip/src/tcpip_notify.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1833714580/tcpip_packet.o: ../../../../../../framework/tcpip/src/tcpip_packet.c  .generated_files/428fdf049774dab131fd298d123924ed499c5f7c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1833714580" 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1833714580/tcpip_packet.o.d" -o ${OBJECTDIR}/_ext/1833714580/tcpip_packet.o ../../../../../../framework/tcpip/src/tcpip_packet.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/eth.o: ../src/eth.c  .generated_files/72ede48037f0a373de8288be8d947556c82c1632.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/eth.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/eth.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/eth.o.d" -o ${OBJECTDIR}/_ext/1360937237/eth.o ../src/eth.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o: ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/f02f99e8365e222a30e50ba82cde98fb555f0dc8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/15694449" 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c  .generated_files/af107ef2b93c64c5157f258895d76e3ae3abd326.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/d018e77960c210ddbff6a791715d9fe570bcc461.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/604921471/sys_ports_static.o: ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c  .generated_files/9bed5808a3ca1e159d6157b463f23ddf7e3bf980.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/604921471" 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_init.o: ../src/system_config/2312_Config/system_init.c  .generated_files/22087420bd3f24894500b89c428140e1cdfc1105.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_init.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_init.o ../src/system_config/2312_Config/system_init.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_interrupt.o: ../src/system_config/2312_Config/system_interrupt.c  .generated_files/b1ed6ae6eacb29ebb33baf4bef41cdeb975ea7d7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ../src/system_config/2312_Config/system_interrupt.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_exceptions.o: ../src/system_config/2312_Config/system_exceptions.c  .generated_files/346253d8d27dced8436a6175dee4c87e312b1a28.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ../src/system_config/2312_Config/system_exceptions.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/20d611f18cde108269f23ff4dd3e2258cd63b31b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_tasks.o: ../src/system_config/2312_Config/system_tasks.c  .generated_files/127ed87e3e20808cb5e7dab5d3d0b5248e3628b0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ../src/system_config/2312_Config/system_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
