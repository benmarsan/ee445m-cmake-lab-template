cmake_minimum_required(VERSION 3.16)

# Setup project, output, and linker files
project(RTOS_Lab5_User)
set(EXECUTABLE ${PROJECT_NAME}.elf)
set(LINKER_FILE ${CMAKE_SOURCE_DIR}/tm4c123gh6pm.ld)

enable_language(C ASM)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(APP_SRC
    src/User.c
    src/osasm.s
    src/display.s
)

add_executable(${EXECUTABLE} ${APP_SRC})

# List of include directories
target_include_directories(${EXECUTABLE} PRIVATE
    inc
    inc/RTOS_Lab5_User
)

# Compiler options
add_compile_options(
    # Compile options for position-independent code
    -mword-relocations
    -mlong-calls
    -fno-common
)

# Linker options
target_link_options(${EXECUTABLE} PRIVATE
    -mword-relocations
    -mlong-calls
    -fno-common
    -nostartfiles
    -T ${CMAKE_CURRENT_SOURCE_DIR}/app.ld
    -Wl,--entry=main
    -Wl,-Map=${PROJECT_NAME}.map,--cref
    -Wl,-r
    -Wl,-Bsymbolic
)

target_link_libraries(${EXECUTABLE} PUBLIC
    TivaWare
    TivaWare_driverlib
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
