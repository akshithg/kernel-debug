# Kernel Debug Environment

## Build kernel with debug info

    make release=v4.19.0rc1 setup_kernel

## Setup disk image

    make setup_disk

## Setup gdb

    make setup_gdb

## boot with qemu

    make boot

## connect gdb

    make gdb
