# set Cmake version
cmake_minimum_required(VERSION 3.16)

###################################################################
# Project Name and language settings
###################################################################
# set project name and language
project(STM32G031K8 LANGUAGES ASM C)

#enable_language(C ASM)
set(CMAKE_C_STANDARD   99)
set(CMAKE_CXX_STANDARD 14)

###################################################################
# Cmake output directory
###################################################################
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build)

###################################################################
# Define outputs
###################################################################
# Define outouts 
set(PROJECT_TYPE "${PROJECT_NAME}_${CMAKE_BUILD_TYPE}")

set(ELF_OUT "${PROJECT_TYPE}.elf")
set(BIN_OUT "${PROJECT_TYPE}.bin")
set(HEX_OUT "${PROJECT_TYPE}.hex")

###################################################################
# Compilier Stuff
###################################################################
set(CMAKE_SYSTEM_NAME      Generic)
set(CMAKE_SYSTEM_VERSION   1)
set(CMAKE_SYSTEM_PROCESSOR arm-none-eabi)

# Be shure that the GCC_PATH varible points to your cross compiler
# This is a Linux system variable
set(ARM_TOOLCHAIN_DIR $ENV{GCC_PATH})

# set toochain name
set(TOOL_CHAIN_PREFIX arm-none-eabi)

# set Toolchain
set(CMAKE_AR               ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-ar)
set(CMAKE_RANLIB           ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-ranlib)
set(CMAKE_LD               ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-ld)
set(CMAKE_C_COMPILER       ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER     ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-g++)
set(CMAKE_ASM_COMPILER     ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-gcc)
set(CMAKE_OBJCOPY     	   ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-objcopy CACHE INTERNAL "objcopy command")
set(CMAKE_OBJDUMP     	   ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-objdump CACHE INTERNAL "objdump command")
set(CMAKE_GDB              ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-gdb)
set(CMAKE_SIZE             ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-size)

# Something something usefull ... Check this what is it done ????
set(CMAKE_FIND_ROOT_PATH ${BINUTILS_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

###################################################################
# Compiler and Linker options
###################################################################
# Compiler flags
set(CORE_OPTIONS   "-mcpu=cortex-m0plus -mthumb")
set(OPTIMALISATION "-Og")
set(OTHER_FLAGS    "-Wall -fdata-sections -ffunction-sections -Wl,-Map=output.map")

set(CMAKE_C_FLAGS   "${CORE_OPTIONS} ${OPTIMALISATION} ${OTHER_FLAGS}"  CACHE INTERNAL "c compiler flags"  )
set(CMAKE_CXX_FLAGS "${CORE_OPTIONS} ${OPTIMALISATION} ${OTHER_FLAGS}"  CACHE INTERNAL "cxx compiler flags")
set(CMAKE_ASM_FLAGS "${CORE_OPTIONS}"                                   CACHE INTERNAL "asm compiler flags")

# Linker Flags
set(EXTRA_LINKER_FLAGS "-lm -lc --specs=nano.specs")
set(LINKER_FILE "${PROJECT_SOURCE_DIR}/STM32G031K8Tx_FLASH.ld")

set(CMAKE_EXE_LINKER_FLAGS "${CORE_OPTIONS} -Wl,-Map=linker.map -Wl,-cref -Wl,--gc-sections" CACHE INTERNAL "exe link flags")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${EXTRA_LINKER_FLAGS} -T${LINKER_FILE}")

###################################################################
# set files to compile
###################################################################
add_definitions(-DSTM32G031xx)
add_definitions(-DUSE_HAL_DRIVER)

###################################################################
# Set files to compile
###################################################################
# C files
set(STM32CUBEMX_GENERATED_FILES
        # Core
        Core/Src/main.c
        Core/Src/gpio.c 
        Core/Src/usart.c 
        Core/Src/stm32g0xx_it.c 
        Core/Src/system_stm32g0xx.c
        Core/Src/stm32g0xx_hal_msp.c
        
        #Drivers
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_rcc.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_dma.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_tim_ex.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_uart_ex.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_rcc_ex.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_flash_ex.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_gpio.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_dma_ex.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_pwr_ex.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_cortex.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal.c 
        Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_hal_exti.c

        #Root 
        startup_stm32g031xx.s
)
add_executable(${ELF_OUT} ${STM32CUBEMX_GENERATED_FILES})

#include directories
include_directories(
        ${CMAKE_SOURCE_DIR}/Core/Inc
        ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32G0xx/Include
        ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Include
        ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Inc
        ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Inc/Legacy
)

###################################################################
# Build the stuff we done
###################################################################
# Create binary and hex file
add_custom_command(TARGET ${ELF_OUT}
        POST_BUILD
        COMMAND ${CMAKE_OBJCOPY}  -O ihex   ${ELF_OUT} ${BIN_OUT}
        COMMAND ${CMAKE_OBJCOPY}  -O binary ${ELF_OUT} ${HEX_OUT})

# Print executable size
add_custom_command(TARGET ${ELF_OUT}
        POST_BUILD
        COMMAND ${CMAKE_SIZE} ${ELF_OUT})        