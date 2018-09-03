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

copy_application_data(){
    sudo cp -r redis ./mnt/root/
}

copy_application_kernel(){
    sudo cp $LINUX_DIR/arch/x86_64/boot/bzImage ./mnt/root/kernel_0 # using the same kernel_0 for now
}

make_image(){
    create_img
    debootstrap "time redis-server"
    enable_networking
    copy_application_data
    copy_application_kernel
    unmount
    mv image.ext4 disk.ext4
}

pushd disk
    LINUX_DIR=../linux
    make_image
popd
