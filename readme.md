# Kernel Dev/Debug Environment

```
.
├── disk // setting up a boot disk
│   ├── apps
│   │   └── redis
│   │       ├── run-bench.sh
│   │       ├── start-redis.sh
│   │       └── stop-redis.sh
│   ├── disk-setup.sh
│   └── interfaces
├── gdb // gdb tools and scripts
│   └── gdb-setup.sh
├── kernel // kernel tools and scripts
│   ├── kernel-text.py
│   └── kernel-build-debuggable.sh
├── kernel_module // kernel module tools and scripts
│   └── Makefile
├── linux // create this
├── Makefile
├── qemu // qemu tools and scripts
│   ├── qemu-boot.sh
│   └── qemu-kill.sh
└── readme.md // this file

```

Prerequisites:

    - gdb
    - qemu
    - linux-kernel

## Useful link

- [Debugging kernel and modules via gdb](https://01.org/linuxgraphics/gfx-docs/drm/dev-tools/gdb-kernel-debugging.html)
- [Unreliable Guide To Hacking The Linux Kernel](https://01.org/linuxgraphics/gfx-docs/drm/kernel-hacking/hacking.html)
