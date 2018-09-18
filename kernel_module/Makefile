obj-m += hello.o
obj-m += kobject-example.o
obj-m += kset-example.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

up:
	sudo insmod hello.ko
	sudo insmod kobject-example.ko
	sudo insmod kset-example.ko

down:
	sudo rmmod hello
	sudo rmmod kobject-example
	sudo rmmod kset-example
