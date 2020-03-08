# Create new system.img file
dd if=/dev/zero of=system.img bs=512 count=2880

# Compile bootloader.asm to bootloader.img
nasm ./ass/bootloader.asm -o ./img/bootloader.img

# Insert bootloader to sector 0
dd if=./img/bootloader.img of=system.img bs=512 count=1 conv=notrunc

# Insert map to sector 0x100 (256)
dd if=./img/map.img of=system.img bs=512 count=1 seek=256 conv=notrunc

# Insert files to sector 0x101 and 0x102 (257, 258)
dd if=./img/files.img of=system.img bs=1024 count=1 seek=257 conv=notrunc

# Insert sectors to sector 0x103 (259)
dd if=./img/sectors.img of=system.img bs=1024 count=1 seek=259 conv=notrunc