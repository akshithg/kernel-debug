#!/bin/bash

IMG=disk.ext4
qemu-img create $IMG 10g
mkfs.ext4 $IMG
sudo mount -o loop $IMG ../mnt
sudo debootstrap --arch amd64 jessie ../mnt
# enable networking
sudo cp interfaces /etc/network/interfaces
sudo umount ../mnt
