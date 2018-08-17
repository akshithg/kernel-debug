#!/bin/bash

IMG=disk.ext4
mkdir -p ./mnt
sudo mount -o loop $IMG ./mnt
sudo cp $1 ./mnt/init
sudo chmod +x ./mnt/init
sudo umount ./mnt
