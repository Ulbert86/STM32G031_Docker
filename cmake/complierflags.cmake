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