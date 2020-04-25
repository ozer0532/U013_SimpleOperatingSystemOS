#!/bin/bash

# Compile lib files
bcc -ansi -c -o ./bin/lib/bushstd.o ./src/lib/bushstd.c
bcc -ansi -c -o ./bin/lib/bushtextio.o ./src/lib/bushtextio.c
bcc -ansi -c -o ./bin/lib/bushfolderio.o ./src/lib/bushfolderio.c
bcc -ansi -c -o ./bin/lib/bushfileio.o ./src/lib/bushfileio.c
bcc -ansi -c -o ./bin/lib/bushmeth.o ./src/lib/bushmath.c
bcc -ansi -c -o ./bin/lib/bushstring.o ./src/lib/bushstring.c

# Compile cat.c to object code
bcc -ansi -c -o ./bin/ext/cat.o ./src/ext/cat.c

# Compile ls.c to object code
bcc -ansi -c -o ./bin/ext/ls.o ./src/ext/ls.c

# Compile rm.c to object code
bcc -ansi -c -o ./bin/ext/rm.o ./src/ext/rm.c

# Compile cp.c to object code
bcc -ansi -c -o ./bin/ext/cp.o ./src/ext/cp.c

# Compile mv.c to object code
bcc -ansi -c -o ./bin/ext/mv.o ./src/ext/mv.c

# Compile mkdir.c to object code
bcc -ansi -c -o ./bin/ext/mkdir.o ./src/ext/mkdir.c

# Compile defrag.c to object code
bcc -ansi -c -o ./bin/ext/defrag.o ./src/ext/defrag.c


# Link cat with compiled lib.asm
ld86 -o ./bin/ext/cat_linked.o -d ./bin/ext/cat.o ./bin/ext/lib.o ./bin/lib/bushstd.o ./bin/lib/bushtextio.o ./bin/lib/bushfolderio.o ./bin/lib/bushfileio.o

# Link ls with compiled lib.asm
ld86 -o ./bin/ext/ls_linked.o -d ./bin/ext/ls.o ./bin/ext/lib.o ./bin/lib/bushstd.o ./bin/lib/bushtextio.o ./bin/lib/bushfolderio.o

# Link rm with compiled lib.asm
ld86 -o ./bin/ext/rm_linked.o -d ./bin/ext/rm.o ./bin/ext/lib.o ./bin/lib/bushstd.o ./bin/lib/bushtextio.o ./bin/lib/bushfolderio.o ./bin/lib/bushfileio.o

# Link cp with compiled lib.asm
ld86 -o ./bin/ext/cp_linked.o -d ./bin/ext/cp.o ./bin/ext/lib.o ./bin/lib/bushstd.o ./bin/lib/bushtextio.o ./bin/lib/bushfolderio.o ./bin/lib/bushfileio.o

# Link cmvp with compiled lib.asm
ld86 -o ./bin/ext/mv_linked.o -d ./bin/ext/mv.o ./bin/ext/lib.o ./bin/lib/bushstd.o ./bin/lib/bushtextio.o ./bin/lib/bushfolderio.o ./bin/lib/bushfileio.o

# Link mkdir with compiled lib.asm
ld86 -o ./bin/ext/mkdir_linked.o -d ./bin/ext/mkdir.o ./bin/ext/lib.o ./bin/lib/bushstd.o ./bin/lib/bushtextio.o ./bin/lib/bushfolderio.o

# Link mkdir with compiled lib.asm
ld86 -o ./bin/ext/defrag_linked.o -d ./bin/ext/defrag.o ./bin/ext/lib.o

# Load linked shell to system 
./loadFile ./bin/ext/cat_linked.o cat
./loadFile ./bin/ext/ls_linked.o ls
./loadFile ./bin/ext/rm_linked.o rm
./loadFile ./bin/ext/cp_linked.o cp
./loadFile ./bin/ext/mv_linked.o mv
./loadFile ./bin/ext/mkdir_linked.o mkdir
./loadFile ./bin/ext/defrag_linked.o defrag
./loadFile ./bin/ext/fraggr_linked.o fraggr