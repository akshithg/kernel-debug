#!/bin/bash

disk = $(DISK)
kernel = $(KERNEL)

LINUX_DIR=./linux
qemu-system-x86_64 \
    -S \
    -s \
    -smp 1 \
    -nographic \
    -append "root=/dev/sda rw nokaslr 1 single console=ttyS0" \
    -hda $(disk) \
    -kernel $(kernel)