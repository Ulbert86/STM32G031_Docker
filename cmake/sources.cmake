###################################################################
# Sources and includes
###################################################################

include(Core/core.cmake)

# C files
set(STM32CUBEMX_GENERATED_FILES
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

# List all the direcotries which ha to be added
set(SOURCE_FILE_LIST 
        ${CORE_FILES}
        ${STM32CUBEMX_GENERATED_FILES}
   )

# add source files to the output
add_executable(${ELF_OUT} ${SOURCE_FILE_LIST})

# include directories
include_directories(
        ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32G0xx/Include
        ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Include
        ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Inc
        ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Inc/Legacy
)