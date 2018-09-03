# Kernel Debug Environment

## Build kernel with debug info

    $ make release=v4.19.0rc1 setup_kernel (for a specific release)
    or
    $ make setup_kernel_git (for the latest torvalds/linux master)

## Setup disk image

    make setup_disk

## Setup gdb

    make setup_gdb

## boot with qemu

    make boot

## connect gdb

    make gdb
    (gdb) target remote :1234
    (gdb) c

## changes to the kernel

    edit-kernel-code in ./linux
    make kernel_build

## Useful link

- [Debugging kernel and modules via gdb](https://01.org/linuxgraphics/gfx-docs/drm/dev-tools/gdb-kernel-debugging.html)
- [Unreliable Guide To Hacking The Linux Kernel](https://01.org/linuxgraphics/gfx-docs/drm/kernel-hacking/hacking.html)
