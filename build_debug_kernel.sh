#!/bin/bash

clone_linux(){
    git clone https://github.com/torvalds/linux/ ./linux --depth=1
}

build_linux(){
    pushd ./linux
        make defconfig
        make kvmconfig

        # https://static.lwn.net/images/pdf/LDD3/ch04.pdf

        # CONFIG_DEBUG_KERNEL
        # CONFIG_DEBUG_SLAB
        # CONFIG_DEBUG_PAGEALLOC
        # CONFIG_DEBUG_SPINLOCK
        # CONFIG_DEBUG_SPINLOCK_SLEEP
        # CONFIG_INIT_DEBUG
        # CONFIG_DEBUG_INFO
        # CONFIG_MAGIC_SYSRQ
        # CONFIG_DEBUG_STACKOVERFLOW
        # CONFIG_DEBUG_STACK_USAGE
        # CONFIG_KALLSYMS
        # CONFIG_IKCONFIG
        # CONFIG_IKCONFIG_PROC
        # CONFIG_ACPI_DEBUG
        # CONFIG_DEBUG_DRIVER
        # CONFIG_SCSI_CONSTANTS
        # CONFIG_INPUT_EVBUG
        # CONFIG_PROFILING

        ./scripts/config --enable CONFIG_DEBUG_KERNEL
        ./scripts/config --enable CONFIG_DEBUG_INFO
        ./scripts/config --enable CONFIG_DEBUG_INFO_DWARF4
        ./scripts/config --enable CONFIG_GDB_SCRIPTS
        ./scripts/config --enable CONFIG_KALLSYMS
        ./scripts/config --disable DEBUG_INFO_REDUCED
        ./scripts/config --disable DEBUG_INFO_SPLIT

        make -j`nproc`
    popd
}

# clone_linux
build_linux