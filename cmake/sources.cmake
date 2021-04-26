###################################################################
# Sources and includes
###################################################################

# include Cmakes from other directories
include(Core/core.cmake)
include(Drivers/drivers.cmake)

# Files from root directory
set(STM32_STARTUP
        startup_stm32g031xx.s
)

# List all the direcotries which ha to be added
set(SOURCE_FILE_LIST 
        ${CORE_FILES}
        ${DRIVERS_FILES}
        ${STM32_STARTUP}
   )

# add source files to the output
add_executable(${ELF_OUT} ${SOURCE_FILE_LIST})