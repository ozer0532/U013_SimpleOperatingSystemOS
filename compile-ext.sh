#!/bin/bash

# Compile lib files
bcc -ansi -c -o ./bin/lib/bushstd.o ./src/lib/bushstd.c
bcc -ansi -c -o ./bin/lib/bushtextio.o ./src/lib/bushtextio.c
bcc -ansi -c -o ./bin/lib/bushfolderio.o ./src/lib/bushfolderio.c
bcc -ansi -c -o ./bin/lib/bushfileio.o ./src/lib/bushfileio.c
bcc -ansi -c -o ./bin/lib/bushmeth.o ./src/lib/bushmath.c

# Compile cat.c to object code
bcc -ansi -c -o ./bin/ext/cat.o ./src/ext/cat.c

# Compile ls.c to object code
bcc -ansi -c -o ./bin/ext/ls.o ./src/ext/ls.c

# Link cat with compiled lib.asm
ld86 -o ./bin/ext/cat_linked.o -d ./bin/ext/cat.o ./bin/ext/lib.o ./bin/lib/bushtextio.o

# Link ls with compiled lib.asm
ld86 -o ./bin/ext/ls_linked.o -d ./bin/ext/ls.o ./bin/ext/lib.o ./bin/lib/bushstd.o ./bin/lib/bushtextio.o ./bin/lib/bushfolderio.o

# Load linked shell to system 
./loadFile ./bin/ext/cat_linked.o cat
./loadFile ./bin/ext/ls_linked.o ls
