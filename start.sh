#!/bin/bash

# Generate new system.img
echo "Generating new system image..."
./generate.sh > /dev/null 2>&1

# Compile and insert kernel
echo "Compiling and inserting kernel..."
./compile-kernel.sh > /dev/null 2>&1

# Compile file/executable loader
echo "Compiling loadFile..."
./compile-loadfile.sh > /dev/null 2>&1

# Compile lib.asm
echo "Compiling lib.asm..."
./compile-lib.sh > /dev/null 2>&1

# Compile and insert shell
echo "Compiling and inserting shell..."
./compile-shell.sh > /dev/null 2>&1

# Compile and insert
echo "Compiling and inserting external programs and its library..."
./compile-ext.sh

# Run the Bochs Emulator
echo "Running emulator..."
./run.sh > /dev/null 2>&1
