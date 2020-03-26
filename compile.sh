#!/bin/bash

# Declare filenames for compiling
# Add ONLY the filenames in ./src directory; no extensions.
declare -a filenames=("kernel" "writeFile" "readString" "printKernel" "readFile" "sectorOperations" "math" "string")

# Compile files in src directory to object code
for i in "${filenames[@]}"
do
    bcc -ansi -c -o ./obj/$i.o ./src/$i.c
done

# Compile kernel.asm to object code
nasm -f as86 ./ass/kernel.asm -o ./obj/kernel_asm.o

# Make parameter for linking
params=""

for i in "${filenames[@]}"
do
    params=" $params ./obj/$i.o"
done

params="$params ./obj/kernel_asm.o"

# Link kernel.asm's object with kernel.c's object
ld86 -o ./img/kernel.img -d $params

# Insert kernel to sector 0x3 (3)
dd if=./img/kernel.img of=system.img bs=512 seek=3 conv=notrunc
