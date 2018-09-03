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
        sudo debootstrap --include="$@" --arch=amd64 jessie ./mnt
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
    sudo cp $LINUX_DIR/arch/x86/boot/vmlinux.bin ./mnt/root/vmlinux_0.bin # using the same kernel_0 for now
}

copy_kernel_module(){
    sudo cp -r kmodule ./mnt/root/
}

make_image(){
    create_img
    mount
    debootstrap "make time redis-server"
    enable_networking
    copy_application_data
    copy_application_kernel
    copy_kernel_module
    unmount
}

remount_update()
{
    mount
    copy_application_data
    copy_application_kernel
    copy_kernel_module
    unmount
}

pushd disk
    LINUX_DIR=../linux
    make_image
    # remount_update
popd
