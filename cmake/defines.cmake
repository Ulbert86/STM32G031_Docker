###################################################################
# Project definications
###################################################################
add_definitions(-DUSE_FULL_LL_DRIVER)
add_definitions(-DHSE_VALUE=8000000)
add_definitions(-DHSE_STARTUP_TIMEOUT=100)
add_definitions(-DLSE_STARTUP_TIMEOUT=5000)
add_definitions(-DLSE_VALUE=32768)
add_definitions(-DEXTERNAL_CLOCK_VALUE=12288000)
add_definitions(-DHSI_VALUE=16000000)
add_definitions(-DLSI_VALUE=32000)
add_definitions(-DVDD_VALUE=3300)
add_definitions(-DPREFETCH_ENABLE=0)
add_definitions(-DINSTRUCTION_CACHE_ENABLE=1)
add_definitions(-DDATA_CACHE_ENABLE=1)
add_definitions(-DSTM32G031xx)
