bcc -ansi -c -o kernel.o kernel.c
nasm -f as86 kernel.asm -o kernel_asm.o
ld86 -o kernel.img -d kernel.o kernel_asm.o
dd if=kernel.img of=system.img bs=512 conv=notrunc seek=3
