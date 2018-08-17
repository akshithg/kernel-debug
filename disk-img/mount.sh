#!/bin/bash

IMG=disk.ext4
mkdir -p ./mnt
sudo mount -o loop $IMG ./mnt
