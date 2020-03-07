nasm -f as86 lib.asm -o lib.o
bcc -ansi -c -o hello.o hello.c
ld86 -o hello -d hello.o lib.o
./loadFile.out hello
