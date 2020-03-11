#!/bin/bash

nasm -f as86 ./ass/lib.asm -o ./obj/lib.o

bcc -ansi -c -o ./obj/hello.o ./src/hello.c

ld86 -o hello -d ./obj/hello.o ./obj/lib.o

./loadFile hello