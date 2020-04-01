#!/bin/bash

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Generate new system.img
echo -e "${YELLOW}Generating new system image...${NC}"
./generate.sh > /dev/null 2>&1

# Compile and insert kernel
echo -e "${YELLOW}Compiling and inserting kernel...${NC}"
./compile-kernel.sh

# Compile file/executable loader
echo -e "${YELLOW}Compiling loadFile...${NC}"
./compile-loadfile.sh

# Compile lib.asm
# echo -e "${YELLOW}Compiling lib.asm...${NC}"
# ./compile-lib.sh

# Compile and insert shell
echo -e "${YELLOW}Compiling and inserting shell...${NC}"
./compile-shell.sh

# Compile and insert
echo -e "${YELLOW}Compiling and inserting external programs and its library...${NC}"
./compile-ext.sh

# Run the Bochs Emulator
echo -e "${YELLOW}Running emulator...${NC}"
./run.sh > /dev/null 2>&1
