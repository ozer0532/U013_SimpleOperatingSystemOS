# Create new system.img file
dd if=/dev/zero of=system.img bs=512 count=2880

# Compile bootloader.asm to bootloader.img
nasm ./ass/bootloader.asm -o ./img/bootloader.img

# Insert bootloader to sector 0
dd if=./img/bootloader.img of=system.img bs=512 count=1 conv=notrunc

# Insert map to sector 1
dd if=./img/map.img of=system.img bs=512 count=1 seek=1 conv=notrunc

# Insert dir to sector 2
dd if=./img/dir.img of=system.img bs=512 count=1 seek=2 conv=notrunc
