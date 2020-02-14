sudo apt install nasm bcc bin86 bochs bochs-x
dd if=/dev/zero of=system.img bs=512 count=2880
nasm bootloader.asm -o bootloader.img
dd if=bootloader.img of=system.img bs=512 count=1 conv=notrunc
dd if=map.img of=system.img bs=512 count=1 seek=1 conv=notrunc
dd if=dir.img of=system.img bs=512 count=1 seek=2 conv=notrunc
