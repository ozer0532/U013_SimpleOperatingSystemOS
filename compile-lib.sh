#!/bin/bash

# Compile lib.asm to object code
nasm -f as86 ./ass/lib.asm -o ./bin/ext/lib.o
