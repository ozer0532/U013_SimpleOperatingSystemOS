#!/bin/bash

gcc -o loadFile ./src/loadFile.c

nasm -f as86 ./ass/lib.asm -o ./bin/lib.o

bcc -ansi -c -o ./bin/shell.o ./src/shell.c

ld86 -o shell -d ./bin/shell.o ./bin/lib.o

./loadFile shell

