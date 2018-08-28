all: 
	echo "make resealse=<> setup_kernel"
	echo "make setup_disk"
	echo "make setup_qemu"
	echo "make setup_gdb"

setup_kernel: kernel_clean kernel_download kernel_extract kernel_build

kernel_download:
	wget https://github.com/torvalds/linux/archive/$(release).tar.gz

kernel_extract:
	tar -xzvf *.tar.gz
	mv linux-* linux

kernel_build:
	./build-debuggable-kernel.sh

kernel_clean:
	rm -rf *.tar.gz *.tar.gz.*

setup_qemu:

setup_disk:
	./disk-setup

setup_gdb:
	./gdb-setup.sh

clean: kernel_clean
	rm -rf .gdb_history peda-session-*

boot:
	./qemu-boot.sh

gdb:
	cd linux && gdb vmlinux
