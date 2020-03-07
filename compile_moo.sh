nasm -f as86 lib.asm -o lib.o
bcc -ansi -c -o moo.o moo.c
ld86 -o moo -d moo.o lib.o
./loadFile.out moo
