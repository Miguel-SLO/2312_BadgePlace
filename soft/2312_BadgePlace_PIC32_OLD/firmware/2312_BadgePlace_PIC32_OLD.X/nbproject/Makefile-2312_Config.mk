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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32_OLD.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32_OLD.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c ../src/system_config/2312_Config/system_init.c ../src/system_config/2312_Config/system_interrupt.c ../src/system_config/2312_Config/system_exceptions.c ../src/system_config/2312_Config/system_tasks.c ../src/app.c ../src/main.c ../src/led.c ../src/SerialTimer.c ../src/TLC5973.c ../src/WERGB.c ../src/FIFO.c ../src/Buzzer.c ../../../../../../framework/system/int/src/sys_int_pic32.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o ${OBJECTDIR}/_ext/220851720/drv_oc_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ${OBJECTDIR}/_ext/1708948888/system_init.o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/led.o ${OBJECTDIR}/_ext/1360937237/SerialTimer.o ${OBJECTDIR}/_ext/1360937237/TLC5973.o ${OBJECTDIR}/_ext/1360937237/WERGB.o ${OBJECTDIR}/_ext/1360937237/FIFO.o ${OBJECTDIR}/_ext/1360937237/Buzzer.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d ${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d ${OBJECTDIR}/_ext/1708948888/system_init.o.d ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/led.o.d ${OBJECTDIR}/_ext/1360937237/SerialTimer.o.d ${OBJECTDIR}/_ext/1360937237/TLC5973.o.d ${OBJECTDIR}/_ext/1360937237/WERGB.o.d ${OBJECTDIR}/_ext/1360937237/FIFO.o.d ${OBJECTDIR}/_ext/1360937237/Buzzer.o.d ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o ${OBJECTDIR}/_ext/220851720/drv_oc_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ${OBJECTDIR}/_ext/1708948888/system_init.o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/led.o ${OBJECTDIR}/_ext/1360937237/SerialTimer.o ${OBJECTDIR}/_ext/1360937237/TLC5973.o ${OBJECTDIR}/_ext/1360937237/WERGB.o ${OBJECTDIR}/_ext/1360937237/FIFO.o ${OBJECTDIR}/_ext/1360937237/Buzzer.o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o

# Source Files
SOURCEFILES=../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c ../src/system_config/2312_Config/system_init.c ../src/system_config/2312_Config/system_interrupt.c ../src/system_config/2312_Config/system_exceptions.c ../src/system_config/2312_Config/system_tasks.c ../src/app.c ../src/main.c ../src/led.c ../src/SerialTimer.c ../src/TLC5973.c ../src/WERGB.c ../src/FIFO.c ../src/Buzzer.c ../../../../../../framework/system/int/src/sys_int_pic32.c



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
	${MAKE}  -f nbproject/Makefile-2312_Config.mk dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32_OLD.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o: ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c  .generated_files/a616a9038d2acd1c6505a3b2d9a9e0f045bd6908.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/220851720" 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d" -o ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/220851720/drv_oc_static.o: ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c  .generated_files/f7ef17378893951cef45016a798963a28e5e1af2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/220851720" 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d" -o ${OBJECTDIR}/_ext/220851720/drv_oc_static.o ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/e0a6dc3077b58d02c1b5fbd0b0aceb3efe5cf330.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/c518b4782f4e451afde10f51a592c5b367cb7e31.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/dc82702514ee8117e35b00a9b1da399835632d2e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_static.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c  .generated_files/b49c50fc66771b14dbbbb13f4f7fe283531ad1b1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/38c2620368dd046b6b6a4131d5faf00f91b5c62d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o: ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/f55b96c50bdb9f0811032217cfc958f975f52b33.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/15694449" 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c  .generated_files/a023ba15c7ba71b4c494d4c6aeed85a8a7645c59.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/19aa16fa8482d5ec87ac6dd48d23dbd554823ec7.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/604921471/sys_ports_static.o: ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c  .generated_files/4b81b59deec1ee770509b6d0d118cfeec3134b6c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/604921471" 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_init.o: ../src/system_config/2312_Config/system_init.c  .generated_files/a0b27d9300f54fb946777b3b17f30e9c54c71d42.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_init.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_init.o ../src/system_config/2312_Config/system_init.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_interrupt.o: ../src/system_config/2312_Config/system_interrupt.c  .generated_files/ce8461648a3cfe3117f7cdb243316c7368d8cfd2.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ../src/system_config/2312_Config/system_interrupt.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_exceptions.o: ../src/system_config/2312_Config/system_exceptions.c  .generated_files/2d8eaff290251b1bf6a066319b4522d068d11e8a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ../src/system_config/2312_Config/system_exceptions.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_tasks.o: ../src/system_config/2312_Config/system_tasks.c  .generated_files/74dfa10207509a93534dbe57035710c92ee8a029.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ../src/system_config/2312_Config/system_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/381d0a43baf54ea5a9955ad3eb70b5b08142c1a8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/1d75cde22ea18c9f9c3ed443457c57b52ea2da63.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/led.o: ../src/led.c  .generated_files/429b8dd4ba40c60edc11d7487e1dbb3baff12989.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/led.o.d" -o ${OBJECTDIR}/_ext/1360937237/led.o ../src/led.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/SerialTimer.o: ../src/SerialTimer.c  .generated_files/523ad12ddc9635409e1af4891c4f6270b3b67c47.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SerialTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SerialTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/SerialTimer.o.d" -o ${OBJECTDIR}/_ext/1360937237/SerialTimer.o ../src/SerialTimer.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/TLC5973.o: ../src/TLC5973.c  .generated_files/eca505b4c1dd47b610dda70d0c48eb3cbf9bc9f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/TLC5973.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/TLC5973.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/TLC5973.o.d" -o ${OBJECTDIR}/_ext/1360937237/TLC5973.o ../src/TLC5973.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/WERGB.o: ../src/WERGB.c  .generated_files/a5eb03eb25153ecd2ff635670adfe9c62cee3964.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/WERGB.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/WERGB.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/WERGB.o.d" -o ${OBJECTDIR}/_ext/1360937237/WERGB.o ../src/WERGB.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/FIFO.o: ../src/FIFO.c  .generated_files/165c999e13923069b87419e1f25c5c5d6c7d1bbf.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/FIFO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/FIFO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/FIFO.o.d" -o ${OBJECTDIR}/_ext/1360937237/FIFO.o ../src/FIFO.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Buzzer.o: ../src/Buzzer.c  .generated_files/b01f023d7786bb02a97f79245e16900ad9dccbc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Buzzer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Buzzer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Buzzer.o.d" -o ${OBJECTDIR}/_ext/1360937237/Buzzer.o ../src/Buzzer.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/282478ba0c85cee7baf6eb1f47d902a8ad315768.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o: ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c  .generated_files/1cce6819a07cf05bdf0e7513a21493e82ad70579.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/220851720" 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o.d" -o ${OBJECTDIR}/_ext/220851720/drv_oc_mapping.o ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/220851720/drv_oc_static.o: ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c  .generated_files/7ebb3ecc9a62ed059414a65767af4f89ee1e6ba0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/220851720" 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/220851720/drv_oc_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/220851720/drv_oc_static.o.d" -o ${OBJECTDIR}/_ext/220851720/drv_oc_static.o ../src/system_config/2312_Config/framework/driver/oc/src/drv_oc_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/28eea7d796c1808838a99d9471194ad6b3a8be4e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_static.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o: ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/ae88d2d512248070ea14ff4e51e34e3af67eb5e3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2062741761" 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/2062741761/drv_tmr_mapping.o ../src/system_config/2312_Config/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/a36522ec028bb249810e635a39c1bbbb162ed26d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_mapping.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_static.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c  .generated_files/d5ddccf712d5ea409bd5640ed32d113276735112.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_static.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o: ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/48520b8e05818bdb54207dd8f92ce300456c082f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1753970347" 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/1753970347/drv_usart_static_byte_model.o ../src/system_config/2312_Config/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o: ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/e47b65a8fcf9269a4cb30354c8a4a6a795014c8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/15694449" 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/15694449/sys_clk_pic32mx.o ../src/system_config/2312_Config/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c  .generated_files/e5ca74b802725d5565995842fcfc3545d0e1ca2c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o: ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/944a0875ac0c99adead30fce41440ff89556defd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/945820938" 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/945820938/sys_devcon_pic32mx.o ../src/system_config/2312_Config/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/604921471/sys_ports_static.o: ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c  .generated_files/650e3cd729328b7e7f6b789874120342fe0e802e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/604921471" 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/604921471/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/604921471/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/604921471/sys_ports_static.o ../src/system_config/2312_Config/framework/system/ports/src/sys_ports_static.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_init.o: ../src/system_config/2312_Config/system_init.c  .generated_files/ff9d69b9312c9fc68a4539abf6260c3169e4f9a8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_init.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_init.o ../src/system_config/2312_Config/system_init.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_interrupt.o: ../src/system_config/2312_Config/system_interrupt.c  .generated_files/c9057e74d66e844f031e60f27a48590ee721542f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_interrupt.o ../src/system_config/2312_Config/system_interrupt.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_exceptions.o: ../src/system_config/2312_Config/system_exceptions.c  .generated_files/70456022b1dbebd7df7fb0af4b69624af603a887.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_exceptions.o ../src/system_config/2312_Config/system_exceptions.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1708948888/system_tasks.o: ../src/system_config/2312_Config/system_tasks.c  .generated_files/ba7e56ad382aced2f1177d7e5e66b315e43ae761.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1708948888" 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1708948888/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1708948888/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1708948888/system_tasks.o ../src/system_config/2312_Config/system_tasks.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/69ad83be9b1cacfb73e90290825b8f0754ff5b5c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/2e5784c64616477df1d3f9d470d15c1ac33eea4c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/led.o: ../src/led.c  .generated_files/919ad18242a72a2ae039efc7a829b95a9d8ef695.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/led.o.d" -o ${OBJECTDIR}/_ext/1360937237/led.o ../src/led.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/SerialTimer.o: ../src/SerialTimer.c  .generated_files/841cdb4b0530a2d064fa2968692dda4b2adc7466.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SerialTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/SerialTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/SerialTimer.o.d" -o ${OBJECTDIR}/_ext/1360937237/SerialTimer.o ../src/SerialTimer.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/TLC5973.o: ../src/TLC5973.c  .generated_files/795b929b20b1a887f0b562aba38506fa54eb820e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/TLC5973.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/TLC5973.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/TLC5973.o.d" -o ${OBJECTDIR}/_ext/1360937237/TLC5973.o ../src/TLC5973.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/WERGB.o: ../src/WERGB.c  .generated_files/93d9d705151a672c5ffb3dd732ca287fca4db766.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/WERGB.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/WERGB.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/WERGB.o.d" -o ${OBJECTDIR}/_ext/1360937237/WERGB.o ../src/WERGB.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/FIFO.o: ../src/FIFO.c  .generated_files/eb760e6da0f56393c26f460a83b750bd68aca7bc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/FIFO.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/FIFO.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/FIFO.o.d" -o ${OBJECTDIR}/_ext/1360937237/FIFO.o ../src/FIFO.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Buzzer.o: ../src/Buzzer.c  .generated_files/433829695f5b4a6273a130bceb1a9a8085e71413.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Buzzer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Buzzer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Buzzer.o.d" -o ${OBJECTDIR}/_ext/1360937237/Buzzer.o ../src/Buzzer.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/711155467/sys_int_pic32.o: ../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/3b4cd397199209b2e36093e5d74da07a2ba3d97e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/711155467" 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/2312_Config" -I"../src/2312_Config" -I"../../../../../../framework" -I"../src/system_config/2312_Config/framework" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/711155467/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/711155467/sys_int_pic32.o ../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32_OLD.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../bin/framework/peripheral/PIC32MX795F512H_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32_OLD.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512H_peripherals.a      -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32_OLD.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../bin/framework/peripheral/PIC32MX795F512H_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32_OLD.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512H_peripherals.a      -DXPRJ_2312_Config=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/2312_BadgePlace_PIC32_OLD.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
