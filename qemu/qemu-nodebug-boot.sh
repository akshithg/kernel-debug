#!/bin/bash

qemu-system-x86_64 \
    -smp 1 \
    -nographic \
    -kernel $1 \
    -append "root=/dev/sda rw nokaslr 1 single console=ttyS0" \
    -hda $2
