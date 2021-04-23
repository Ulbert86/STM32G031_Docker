###################################################################
# Compiler path and name
###################################################################

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

# STM32 somehow fails to compile the startup_s file if the arm-none-eabi-as is added
# so the GCC have to be added for the assembly compile 
set(CMAKE_ASM_COMPILER     ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-gcc)

set(CMAKE_OBJCOPY     	   ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-objcopy CACHE INTERNAL "objcopy command")
set(CMAKE_OBJDUMP     	   ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-objdump CACHE INTERNAL "objdump command")
set(CMAKE_GDB              ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-gdb)
set(CMAKE_SIZE             ${ARM_TOOLCHAIN_DIR}/${TOOL_CHAIN_PREFIX}-size)