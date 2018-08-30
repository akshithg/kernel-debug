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


## Useful link

- [Debugging kernel and modules via gdb](https://01.org/linuxgraphics/gfx-docs/drm/dev-tools/gdb-kernel-debugging.html)
- [Unreliable Guide To Hacking The Linux Kernel](https://01.org/linuxgraphics/gfx-docs/drm/kernel-hacking/hacking.html)
