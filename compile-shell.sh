#!/bin/bash

# Compile shell.c to object code
bcc -ansi -c -o ./bin/ext/shell.o ./src/ext/shell.c

# Link compiled shell to lib
ld86 -o ./bin/ext/shell_linked.o -d ./bin/ext/shell.o ./bin/ext/lib.o

# Load linked shell object code
./loadFile ./bin/ext/shell_linked.o shell
