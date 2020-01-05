CC = gcc
ASM = nasm
LD = ld

CC_FLAGS = -Wall -m32 -ggdb -gstabs+ -fno-builtin -I libs -fno-stack-protector
LD_FLAGS = -T link.ld -m elf_i386 -nostdlib boot/boot.o
HOME = kern/init/
MOUNT_POINT = /mnt/geOS

all:clean build img
#nasm -f elf boot/boot.asm
clean:
    rm -rf ${HOME}/*.o
build:kernel
    ${CC} ${CC_FLAGS} -c ${HOME}/init.c -o ${HOME}/init.o
    ${CC} ${CC_FLAGS} -c ${HOME}/common.c -o ${HOME}/common.o
    ${CC} ${CC_FLAGS} -c ${HOME}/monitor.c -o ${HOME}/monitor.o
    ${LD} ${HOME}/init.o ${HOME}/common.o ${HOME}/monitor.o -o kernel
img:
    @if [ ! -d $(MOUNT_POINT) ]; then mkdir $(MOUNT_POINT); fi
    sudo mount geOS.img /mnt/geOS
    sudo cp kernel /mnt/geOS/kernel
    sleep 1
    sudo umount /mnt/geOS

