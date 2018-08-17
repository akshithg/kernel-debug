# Kernel Debug Environment

1. Build kernel with debug info
    ```
    ./build_debug_kernel.sh
    ```

2. create disk image
    ```
    cd disk-img && ./create-image.sh && cd ..
    ```

3. boot kernel in qemu with gdb
    ```
    ./qemu_boot_kernel.sh
    ```

4. connect to gdb
    ```
    gdb ../linux/vmlinux
    (gdb) target remote localhost:1234
    ```
