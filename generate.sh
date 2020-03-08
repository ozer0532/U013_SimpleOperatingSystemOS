# Create new system.img file
dd if=/dev/zero of=system.img bs=512 count=2880

# Compile bootloader.asm to bootloader.img
nasm ./ass/bootloader.asm -o ./img/bootloader.img

# Insert bootloader to sector 0
dd if=./img/bootloader.img of=system.img bs=512 count=1 conv=notrunc

# Insert map to sector 0x100
dd if=./img/map.img of=system.img bs=512 count=1 seek=0x100 conv=notrunc

# Insert files to sector 0x101
dd if=./img/files.img of=system.img bs=1024 count=1 seek=0x101 conv=notrunc

# Insert sectors to sector 0x103
dd if=./img/sectors.img of=system.img bs=512 count=1 seek=0x103 conv=notrunc
