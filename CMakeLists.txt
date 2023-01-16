cmake_minimum_required(VERSION 3.16)

# Path to toolchain file. This one has to be before 'project()' below
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/cmake/arm-none-eabi-gcc.cmake)

# Generate compile_commands.json for vscode
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

# Used for auto-generating vscode debug configuration
set(VSCODE_DIR "${CMAKE_SOURCE_DIR}/.vscode")
include(${CMAKE_SOURCE_DIR}/cmake/vscode-debug.cmake)

project(RTOS_Labs)

enable_language(C ASM)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# List of compiler defines, prefix with -D compiler option
add_compile_definitions(
    PART_TM4C123GH6PM
    TARGET_IS_TM4C123_RB1
)

# Compiler options
add_compile_options(
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
    # Optimizations
    -ffunction-sections
    -fdata-sections
    -O0
    -g3
    # Compile warnings
    # -Wall
    # -Werror
    # -Wextra
    # -Wpedantic
)

# Linker options
add_link_options(
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
    -Wl,--gc-sections
    -Wl,-print-memory-usage
)

link_libraries(
    c
    m
    g
    gcc
)

add_subdirectory(libraries/TivaWare)
add_subdirectory(libraries/ValvanoWare)
add_subdirectory(RTOS_Labs_common)
add_subdirectory(RTOS_Lab1_Interpreter)
add_subdirectory(RTOS_Lab2_RTOSkernel)
add_subdirectory(RTOS_Lab3_RTOSpriority)
add_subdirectory(RTOS_Lab4_FileSystem)
add_subdirectory(RTOS_Lab5_ProcessLoader)
add_subdirectory(RTOS_Lab5_User)
add_subdirectory(RTOS_Lab6_Networking)
