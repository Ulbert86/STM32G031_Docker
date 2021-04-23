###################################################################
# Sources Files add
###################################################################
# Add source files
file(GLOB_RECURSE CORE_FILES "${CMAKE_SOURCE_DIR}/Core/Src/*.c")

###################################################################
# Include Path add
###################################################################
include_directories( ${CMAKE_SOURCE_DIR}/Core/Inc )