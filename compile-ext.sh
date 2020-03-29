#!/bin/bash

# Compile cat.c to objet code
bcc -ansi -c -o ./bin/ext/cat.o ./src/ext/cat.c
bcc -ansi -c -o ./bin/lib/bushtextio.o ./src/lib/bushtextio.c

# Link cat with compiled lib.asm
ld86 -o ./bin/ext/cat_linked.o -d ./bin/ext/cat.o ./bin/ext/lib.o ./bin/lib/bushtextio.o

# Load linked shell to system 
./loadFile ./bin/ext/cat_linked.o cat

