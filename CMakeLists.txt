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

# Something something usefull ... Check this what is it done ????
set(CMAKE_FIND_ROOT_PATH ${BINUTILS_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

###################################################################
# Toolchain
###################################################################
include(cmake/toolchain.cmake)

###################################################################
# Compiler and Linker options
###################################################################
include(cmake/complierflags.cmake)

###################################################################
# Project definications
###################################################################
include(cmake/defines.cmake)

###################################################################
# Sources and includes
###################################################################
include(cmake/sources.cmake)

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