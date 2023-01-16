cmake_minimum_required(VERSION 3.16)

project(RTOS_Labs_common)

file(GLOB LIB_SRCS CONFIGURE_DEPENDS
    "src/*.c"
    "src/*.s"
)

add_library(${PROJECT_NAME} STATIC ${LIB_SRCS})

target_include_directories(${PROJECT_NAME} PRIVATE inc/RTOS_Labs_common)
target_include_directories(${PROJECT_NAME} PUBLIC  inc)

target_link_libraries(${PROJECT_NAME} PUBLIC
    TivaWare
    TivaWare_driverlib
    ValvanoWare_ADCSWTrigger
    ValvanoWare_ADCT0ATrigger
    ValvanoWare_CortexM
    ValvanoWare_WTimer0A
)
