#!/bin/bash

# Compile kernel.c to object code
bcc -ansi -c -o ./obj/kernel.o ./src/kernel.c

# Compile kernel.asm to object code
nasm -f as86 ./ass/kernel.asm -o ./obj/kernel_asm.o

# Link kernel.asm's object with kernel.c's object
ld86 -o ./img/kernel.img -d ./obj/kernel.o ./obj/kernel_asm.o

# Insert kernel to sector 0x3 (3)
dd if=./img/kernel.img of=system.img bs=512 seek=3 conv=notrunc
