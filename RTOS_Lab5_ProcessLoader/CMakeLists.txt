cmake_minimum_required(VERSION 3.16)

# Setup project, output, and linker files
project(RTOS_Lab5_ProcessLoader)
set(EXECUTABLE ${PROJECT_NAME}.elf)
set(LINKER_FILE ${CMAKE_SOURCE_DIR}/tm4c123gh6pm.ld)

enable_language(C ASM)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(APP_SRC
    src/startup.c
    src/Lab5.c
    src/loader.c
    src/ff.c
    src/eFile.c
)

add_executable(${EXECUTABLE} ${APP_SRC})

# List of include directories
target_include_directories(${EXECUTABLE} PRIVATE
    inc
    inc/RTOS_Lab5_ProcessLoader
)

# Linker options
target_link_options(${EXECUTABLE} PRIVATE
    -T${LINKER_FILE}
    -Wl,-Map=${PROJECT_NAME}.map,--cref
)

target_link_libraries(${EXECUTABLE} PUBLIC
    TivaWare
    TivaWare_driverlib
    ValvanoWare_LaunchPad
    ValvanoWare_PLL
    ValvanoWare_LPF
    ValvanoWare_Timer4A
    ValvanoWare_IRDistance
    ValvanoWare_fft
    ValvanoWare_PID_stm32
    RTOS_Labs_common
)

# Print executable size as part of the post build process
add_custom_command(TARGET ${EXECUTABLE}
    POST_BUILD
    COMMAND ${CMAKE_SIZE_UTIL} ${EXECUTABLE}
)

# Create hex, bin and S-Record files after the build
set(BIN_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.bin)
set(S19_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.s19)
set(HEX_FILE ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
add_custom_command(TARGET ${EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${EXECUTABLE}> ${BIN_FILE}
    # COMMAND ${CMAKE_OBJCOPY} -O srec --srec-len=64 $<TARGET_FILE:${EXECUTABLE}> ${S19_FILE}
    # COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${EXECUTABLE}> ${HEX_FILE}
    COMMENT "Building ${BIN_FILE}"
)

flash_target(${BIN_FILE} flash-${PROJECT_NAME})

add_custom_command(
    TARGET ${EXECUTABLE}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -DPROJ_ROOT_DIR="${CMAKE_SOURCE_DIR}" -DVSCODE_DIR="${VSCODE_DIR}" -DPROJ_NAME="${PROJECT_NAME}" -DPROJ_ELF_PATH="${PROJECT_BINARY_DIR}/${EXECUTABLE}" -DOPENOCD_CFG="${OPENOCD_CFG}" -P "${CMAKE_SOURCE_DIR}/cmake/vscode-debug-run.cmake"
)
