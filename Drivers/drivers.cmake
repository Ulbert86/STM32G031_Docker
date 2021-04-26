###################################################################
# Sources Files add
###################################################################
# Add source files
set(DRIVERS_FILES
    #Drivers
    ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_utils.c 
    ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_exti.c 
    ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_gpio.c 
    ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_pwr.c 
    ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_usart.c 
    ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_rcc.c 
    ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Src/stm32g0xx_ll_dma.c 
)

###################################################################
# Include Path add
###################################################################
# include directories
include_directories(
    ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32G0xx/Include
    ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Include
    ${CMAKE_SOURCE_DIR}/Drivers/STM32G0xx_HAL_Driver/Inc
)