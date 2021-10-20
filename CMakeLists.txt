cmake_minimum_required(VERSION 3.10)
set(CMAKE_C_STANDARD 11)
project(troonix C)

set(LINKER_SCRIPT "Targets/x86-64/linker.ld")

set(CMAKE_C_COMPILER clang)
set(CMAKE_C_FLAGS "      \
    -fuse-ld=lld         \
	-ffreestanding       \
	-fno-stack-protector \
	-fno-pic             \
	-mno-red-zone        \
")

set(CMAKE_EXE_LINKER_FLAGS "                    \
	-nostdlib                                   \
	-T${LINKER_SCRIPT}                          \
")

INCLUDE_DIRECTORIES (Include)
FILE (GLOB_RECURSE kernel_c_src "Kernel/*.c")

add_executable(${PROJECT_NAME}.elf
                    ${kernel_c_src})