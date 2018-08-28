#!/bin/bash 

set -e

create_img(){
    IMG=image.ext4
    qemu-img create $IMG 10g
    mkfs.ext4 $IMG
    mkdir -p mnt
    sudo mount -o loop $IMG ./mnt
}

debootstrap(){
    if test -z "$@"
    then
        sudo debootstrap --arch=amd64 --variant=minbase jessie ./mnt
    else
        sudo debootstrap --include="$@" --arch=amd64 --variant=minbase jessie ./mnt
    fi
}

enable_networking(){
    sudo cp interfaces ./mnt/etc/network/interfaces
}

unmount(){
    sudo umount ./mnt
}

make_image(){
    create_img
    debootstrap "time redis-server"
    enable_networking
    unmount
    mv image.ext4 disk.ext4
}

pushd disk
    make_image
popd
