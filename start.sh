#!/bin/bash

# Generate new system.img
echo "Generating new system image..."
./generate.sh

# Compile and insert kernel
echo "Compiling and inserting kernel..."
./compile-kernel.sh

# Compile file/executable loader
echo "Compiling loadFile..."
./compile-loadfile.sh

# Compile lib.asm
echo "Compiling lib.asm..."
./compile-lib.sh

# Compile and insert shell
echo "Compiling and inserting shell..."
./compile-shell.sh

# Run the Bochs Emulator
echo "Running emulator..."
./run.sh
