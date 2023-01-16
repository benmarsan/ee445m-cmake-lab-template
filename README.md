# ECE 380L.12/445M Labs

This project contains the lab starter code for ECE 380L.12/ECE 445M at the University of Texas at
Austin taught by Andreas Gerstlauer and Jonathon Valvano.

## Getting Started (Windows)

### Dependencies
Install the following dependencies:

- [CMake](https://cmake.org/download/)
  - Make sure to select add to path in the installer (either user or system path will work)
- [Ninja](https://ninja-build.org/) (or make)
  - Download latest ninja-win.zip from [the official Github](https://github.com/ninja-build/ninja/releases)
  - Copy `ninja.exe` to `C:\Program Files\CMake\bin\` (Needs to be somewhere in your path)
- [GNU Arm Embedded Toolchain](https://developer.arm.com/downloads/-/gnu-rm) (get latest `gcc-arm-none-eabi-*-win32.exe`)
  - Make sure to select "Add path to environment variable" at the last step
- [OpenOCD](https://openocd.org/)
  - Download [Windows release from Github](https://github.com/openocd-org/openocd/releases/tag/v0.11.0). (v0.12.0 was just released. It may work, but I haven't tested. Older versions do not work.)
  - Extract the contents of `openocd-v0.11.0-i686-w64-mingw32.tar.gz` to `C:\openocd-v0.11.0` (7-Zip can be used to extract .tar.gz archives on Windows)
  - Add `C:\openocd-v0.11.0\bin` to your path.
- [Visual Studio Code](https://code.visualstudio.com/)

### VSCode
Install these extensions:
- C/C++
- CMake
- CMake Tools
- Cortex-Debug

Then, you should be able to select the "TM4C Toolchain" CMake kit, configure the project, and build
all of the targets.

When working on a lab, you should set the active target in the bottom status bar to the executable
for the lab you're currently working on. This prevents building the other labs at the same time.
(ex: `RTOS_Lab1_Interpreter.elf`, `RTOS_Lab2_RTOSkernel.elf`, etc.)
