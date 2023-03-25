# ECE 380L.12/445M Labs

This project contains the lab starter code for ECE 380L.12/ECE 445M at the University of Texas at
Austin taught by Andreas Gerstlauer and Jonathon Valvano. The original starter code is available
on [Dr. Valvano's website](http://users.ece.utexas.edu/~valvano/arm/).

## Getting Started
### Linux Dependencies:
```
sudo apt install gcc-arm-none-eabi gdb-multiarch binutils-multiarch cmake
sudo apt install openocd
sudo apt install lm4flash
```
`lm4flash` is optional -- the flash script is configured to flash with OpenOCD for Windows compatibility.


### Windows Dependencies:
Install the following dependencies:

- [CMake](https://cmake.org/download/)
  - Make sure to select add to path in the installer (either user or system path will work)
- [Ninja](https://ninja-build.org/) (or make)
  - Download latest ninja-win.zip from [the official Github](https://github.com/ninja-build/ninja/releases)
  - Copy `ninja.exe` to `C:\Program Files\CMake\bin\` (Or elsewhere in your path)
- [GNU Arm Embedded Toolchain](https://developer.arm.com/downloads/-/gnu-rm) (get latest `gcc-arm-none-eabi-*-win32.exe`)
  - Make sure to select "Add path to environment variable" at the last step
- [OpenOCD](https://openocd.org/)
  - Download [Windows release from Github](https://github.com/openocd-org/openocd/releases/tag/v0.12.0).
    - v0.11.0 and v0.12.0 worked for me. Earlier versions did not work, future versions probably should work.
  - Extract the contents of `openocd-v0.12.0-i686-w64-mingw32.tar.gz` to `C:\openocd-v0.12.0` (7-Zip can be used to extract .tar.gz archives on Windows)
  - Add `C:\openocd-v0.12.0\bin` to your path.
- [Visual Studio Code](https://code.visualstudio.com/)


### Set up Visual Studio Code:
Install vscode from [Microsoft](https://code.visualstudio.com/)

Install these extensions:
- C/C++
- CMake
- CMake Tools
- Cortex-Debug

When you first open this project in VSCode, you will need to set the "CMake Kit" to `TM4C Toolchain`
to select the installed arm-gcc compiler and set the CMake Generator to `Ninja`. You will also need
to set the build variant (`Debug`) and build target (`Test.elf`). Once this has been done, you
should be able run `CMake: Configure` and `CMake: Build` (`ctrl-shift-P` to open command palette).
The shortcut `ctrl-shift-B` can be used to run the default build task (set in `.vscode/tasks.json`).

When working on a lab, you should set the active target in the bottom status bar to the executable
for the lab you're currently working on. This prevents building the other labs at the same time.
(ex: `RTOS_Lab1_Interpreter.elf`, `RTOS_Lab2_RTOSkernel.elf`, etc.)


### Command Line Development
This project will work without VSCode if you want to use another text editor. To compile and flash
from the command line:
```
mkdir build
cd build
cmake ..
make Test.elf
make flash
```
Or on Windows:
```
mkdir build
cd build
cmake -G "Ninja" ..
ninja Test.elf
ninja flash
```
