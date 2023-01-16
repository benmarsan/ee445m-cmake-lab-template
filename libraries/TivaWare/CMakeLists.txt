cmake_minimum_required(VERSION 3.16)

project(TivaWare)

add_library(${PROJECT_NAME} INTERFACE)
target_include_directories(${PROJECT_NAME} INTERFACE inc)

file(GLOB TivaWare_DRIVERLIB_SRCS CONFIGURE_DEPENDS "driverlib/*.c")
add_library(${PROJECT_NAME}_driverlib STATIC ${TivaWare_DRIVERLIB_SRCS})
target_include_directories(${PROJECT_NAME}_driverlib PUBLIC ${PROJECT_SOURCE_DIR})
target_link_libraries(${PROJECT_NAME}_driverlib ${PROJECT_NAME})
