#!/bin/bash 

set -e

IMG=disk.ext4

create_img(){
    qemu-img create $IMG 10g
    mkfs.ext4 $IMG
}

mount(){
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
    rm -rf mnt
}

copy_application_data(){
    sudo cp -r apps ./mnt/root/
}

copy_application_kernel(){
    sudo cp $LINUX_DIR/arch/x86/boot/vmlinux.bin ./mnt/root/vmlinux_0.bin # using the same kernel_0 for now
}

copy_kernel_module(){
    sudo cp -r ../kernel_module ./mnt/root/
}

make_base_image(){
    create_img
    mount
    debootstrap "make time redis-server"
    enable_networking
    unmount
    cp disk.ext4 base.ext4
}

add_stuff(){
    cp base.ext4 disk.ext4
    mount
    copy_application_data
    copy_application_kernel
    copy_kernel_module
    unmount
}

LINUX_DIR=../linux
make_base_image
add_stuff