#!/bin/bash

qemu-system-x86_64 \
    -s \
    -S \
    -smp 1 \
    -nographic \
    -append "root=/dev/sda nokaslr 1 single console=ttyS0" \
    -hda ./disk-img/disk.ext4 \
    -kernel  ../linux/arch/x86_64/boot/bzImage