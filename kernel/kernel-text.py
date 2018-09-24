#!/usr/bin/env pypy
# -*- coding: utf-8 -*-

import os
import subprocess
import sys

KERNEL_BASE = 0
KERNEL_OFFSET = 0
KERNEL_SIZE = 0


def parse_kernel(kernel_name):
    global KERNEL_BASE, KERNEL_OFFSET, KERNEL_SIZE

    o = subprocess.check_output('readelf -S %s | grep -A 1 "] .text"' % \
            kernel_name,
            shell=True)
    arr = o.split()

    KERNEL_BASE = int(arr[4], 16)
    KERNEL_OFFSET = int(arr[5], 16)
    KERNEL_SIZE = int(arr[6], 16)
    print("base: 0x%016x offset: 0x%016x size: 0x%016x" % (KERNEL_BASE, KERNEL_OFFSET, KERNEL_SIZE))


def get_text(kernel_name):
    fd = open(kernel_name, "rb")
    kernel_head = fd.read(KERNEL_OFFSET)
    kernel_text = fd.read(KERNEL_SIZE)
    kernel_tail = fd.read()
    fd.close()
    fd = open("./kernel_text", "wb")
    fd.write(kernel_text)
    fd.close()


def usage():
    print("{} <kernel>".format(sys.argv[0]))

if __name__ == "__main__":
    if len(sys.argv) < 2:
        usage()
        exit(1)

    parse_kernel(sys.argv[1])
    get_text(sys.argv[1])
