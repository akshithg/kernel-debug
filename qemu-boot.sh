#!/bin/bash

LINUX_DIR=./linux
qemu-system-x86_64 \
    -s \
    -S \
    -smp 1 \
    -nographic \
    -append "root=/dev/sda rw nokaslr 1 single console=ttyS0" \
    -hda ./disk/disk.ext4 \
    -kernel  $LINUX_DIR/arch/x86_64/boot/bzImage
