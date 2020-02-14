! 1 
! 1 # 1 "kernel.c"
! 1 
! 2 void handleInterrupt21 ();
!BCC_EOS
! 3 void printString();
!BCC_EOS
! 4 void readString();
!BCC_EOS
! 5 void readSector();
!BCC_EOS
! 6 void writeSector();
!BCC_EOS
! 7 void readFile();
!BCC_EOS
! 8 void clear(); 
!BCC_EOS
! 9 void writeFile();
!BCC_EOS
! 10 void executeProgram();
!BCC_EOS
! 11 void returnToKernel();
!BCC_EOS
! 12 
! 13 int div();
!BCC_EOS
! 14 int mod();
!BCC_EOS
! 15 
! 16 int getEmptySectorCount();
!BCC_EOS
! 17 int getFirstEmptySector();
!BCC_EOS
! 18 
! 19 char isStringEqual();
!BCC_EOS
! 20 
! 21 
! 22 void printBootLogo();
!BCC_EOS
! 23 
! 24 
! 25 int main ()
! 26 # 25 "kernel.c"
! 25 {
export	_main
_main:
! 26 	char command[512];
!BCC_EOS
! 27 	char filename[512];
!BCC_EOS
! 28 	char fileRead[512 * 20];
!BCC_EOS
! 29 	int flag = 1;
push	bp
mov	bp,sp
push	di
push	si
add	sp,#-$2C02
! Debug: eq int = const 1 to int flag = [S+$2C08-$2C08] (used reg = )
mov	ax,*1
mov	-$2C06[bp],ax
!BCC_EOS
! 30 	int i;
!BCC_EOS
! 31 
! 32     makeInterrupt21();
dec	sp
dec	sp
! Debug: func () int = makeInterrupt21+0 (used reg = )
call	_makeInterrupt21
!BCC_EOS
! 33 
! 34 	printBootLogo();
! Debug: func () void = printBootLogo+0 (used reg = )
call	_printBootLogo
!BCC_EOS
! 35 
! 36 	interrupt(0x21,0,"\n",0,0);
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list * char = .1+0 (used reg = )
mov	bx,#.1
push	bx
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $21 (used reg = )
mov	ax,*$21
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 37 
! 38     while (1) {
.4:
! 39 		printString("bushes:~ ");
! Debug: list * char = .5+0 (used reg = )
mov	bx,#.5
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 40 		readString(command);
! Debug: list * char command = S+$2C0A-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () void = readString+0 (used reg = )
call	_readString
inc	sp
inc	sp
!BCC_EOS
! 41 		if(isStringEqual(command,"moo",3))
! Debug: list int = const 3 (used reg = )
mov	ax,*3
push	ax
! Debug: list * char = .7+0 (used reg = )
mov	bx,#.7
push	bx
! Debug: list * char command = S+$2C0E-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () char = isStringEqual+0 (used reg = )
call	_isStringEqual
add	sp,*6
test	al,al
je  	.6
.8:
! 42 		{
! 43 			executeProgram("moo",0x2000,&flag);
! Debug: list * int flag = S+$2C0A-$2C08 (used reg = )
lea	bx,-$2C06[bp]
push	bx
! Debug: list int = const $2000 (used reg = )
mov	ax,#$2000
push	ax
! Debug: list * char = .9+0 (used reg = )
mov	bx,#.9
push	bx
! Debug: func () void = executeProgram+0 (used reg = )
call	_executeProgram
add	sp,*6
!BCC_EOS
! 44 		}
! 45 		else if(isStringEqual(command,"hello",5))
br 	.A
.6:
! Debug: list int = const 5 (used reg = )
mov	ax,*5
push	ax
! Debug: list * char = .C+0 (used reg = )
mov	bx,#.C
push	bx
! Debug: list * char command = S+$2C0E-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () char = isStringEqual+0 (used reg = )
call	_isStringEqual
add	sp,*6
test	al,al
je  	.B
.D:
! 46 		{
! 47 			executeProgram("hello",0x2000,&flag);
! Debug: list * int flag = S+$2C0A-$2C08 (used reg = )
lea	bx,-$2C06[bp]
push	bx
! Debug: list int = const $2000 (used reg = )
mov	ax,#$2000
push	ax
! Debug: list * char = .E+0 (used reg = )
mov	bx,#.E
push	bx
! Debug: func () void = executeProgram+0 (used reg = )
call	_executeProgram
add	sp,*6
!BCC_EOS
! 48 		}
! 49 		else if(isStringEqual(command,"uwu",3))
jmp .F
.B:
! Debug: list int = const 3 (used reg = )
mov	ax,*3
push	ax
! Debug: list * char = .11+0 (used reg = )
mov	bx,#.11
push	bx
! Debug: list * char command = S+$2C0E-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () char = isStringEqual+0 (used reg = )
call	_isStringEqual
add	sp,*6
test	al,al
je  	.10
.12:
! 50 		{
! 51 			readFile(fileRead,"key.txt",&flag);
! Debug: list * int flag = S+$2C0A-$2C08 (used reg = )
lea	bx,-$2C06[bp]
push	bx
! Debug: list * char = .13+0 (used reg = )
mov	bx,#.13
push	bx
! Debug: list * char fileRead = S+$2C0E-$2C06 (used reg = )
lea	bx,-$2C04[bp]
push	bx
! Debug: func () void = readFile+0 (used reg = )
call	_readFile
add	sp,*6
!BCC_EOS
! 52 			printString(fileRead);
! Debug: list * char fileRead = S+$2C0A-$2C06 (used reg = )
lea	bx,-$2C04[bp]
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 53 			printString("\r\n");
! Debug: list * char = .14+0 (used reg = )
mov	bx,#.14
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 54 		}
! 55 		else if(isStringEqual(command,"milestone1",10))
jmp .15
.10:
! Debug: list int = const $A (used reg = )
mov	ax,*$A
push	ax
! Debug: list * char = .17+0 (used reg = )
mov	bx,#.17
push	bx
! Debug: list * char command = S+$2C0E-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () char = isStringEqual+0 (used reg = )
call	_isStringEqual
add	sp,*6
test	al,al
je  	.16
.18:
! 56 		{
! 57 			executeProgram("milestone1",0x2000,&flag);
! Debug: list * int flag = S+$2C0A-$2C08 (used reg = )
lea	bx,-$2C06[bp]
push	bx
! Debug: list int = const $2000 (used reg = )
mov	ax,#$2000
push	ax
! Debug: list * char = .19+0 (used reg = )
mov	bx,#.19
push	bx
! Debug: func () void = executeProgram+0 (used reg = )
call	_executeProgram
add	sp,*6
!BCC_EOS
! 58 		}
! 59 		
! 60 		
! 61 		
! 62 		
! 63 		
! 64 		
! 65 	}
.16:
.15:
.F:
.A:
! 66 }
.3:
br 	.4
.1A:
.2:
lea	sp,-4[bp]
pop	si
pop	di
pop	bp
ret
! 67 
! 68 void handleInterrupt21 (AX,BX,CX,DX)
! Register BX used in function main
! 69 # 68 "kernel.c"
! 68 int AX;
export	_handleInterrupt21
_handleInterrupt21:
!BCC_EOS
! 69 # 68 "kernel.c"
! 68 int BX;
!BCC_EOS
! 69 # 68 "kernel.c"
! 68 int CX;
!BCC_EOS
! 69 # 68 "kernel.c"
! 68 int DX;
!BCC_EOS
! 69 # 68 "kernel.c"
! 68 {
! 69     switch (AX) {
push	bp
mov	bp,sp
push	di
push	si
mov	ax,4[bp]
br 	.1D
! 70 	case 0x7:
! 71 		printString("RAN CODE");
.1E:
! Debug: list * char = .1F+0 (used reg = )
mov	bx,#.1F
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 72 		returnToKernel();
! Debug: func () void = returnToKernel+0 (used reg = )
call	_returnToKernel
!BCC_EOS
! 73 		break;
br 	.1B
!BCC_EOS
! 74 	case 0x0:
! 75 		printString("RAN CODE");
.20:
! Debug: list * char = .21+0 (used reg = )
mov	bx,#.21
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 76 		printString(BX);
! Debug: list int BX = [S+6+4] (used reg = )
push	6[bp]
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 77 		break;
br 	.1B
!BCC_EOS
! 78 	case 0x1:
! 79 		readString(BX);
.22:
! Debug: list int BX = [S+6+4] (used reg = )
push	6[bp]
! Debug: func () void = readString+0 (used reg = )
call	_readString
inc	sp
inc	sp
!BCC_EOS
! 80 		break;
jmp .1B
!BCC_EOS
! 81 	case 0x2:
! 82 		readSector(BX,CX);
.23:
! Debug: list int CX = [S+6+6] (used reg = )
push	8[bp]
! Debug: list int BX = [S+8+4] (used reg = )
push	6[bp]
! Debug: func () void = readSector+0 (used reg = )
call	_readSector
add	sp,*4
!BCC_EOS
! 83 		break;
jmp .1B
!BCC_EOS
! 84 	case 0x3:
! 85 		writeSector(BX,CX);
.24:
! Debug: list int CX = [S+6+6] (used reg = )
push	8[bp]
! Debug: list int BX = [S+8+4] (used reg = )
push	6[bp]
! Debug: func () void = writeSector+0 (used reg = )
call	_writeSector
add	sp,*4
!BCC_EOS
! 86 		break;
jmp .1B
!BCC_EOS
! 87 	case 0x4:
! 88 		readFile(BX,CX,DX);
.25:
! Debug: list int DX = [S+6+8] (used reg = )
push	$A[bp]
! Debug: list int CX = [S+8+6] (used reg = )
push	8[bp]
! Debug: list int BX = [S+$A+4] (used reg = )
push	6[bp]
! Debug: func () void = readFile+0 (used reg = )
call	_readFile
add	sp,*6
!BCC_EOS
! 89 		break;
jmp .1B
!BCC_EOS
! 90 	case 0x5:
! 91 		writeFile(BX,CX,DX);
.26:
! Debug: list int DX = [S+6+8] (used reg = )
push	$A[bp]
! Debug: list int CX = [S+8+6] (used reg = )
push	8[bp]
! Debug: list int BX = [S+$A+4] (used reg = )
push	6[bp]
! Debug: func () void = writeFile+0 (used reg = )
call	_writeFile
add	sp,*6
!BCC_EOS
! 92 		break;
jmp .1B
!BCC_EOS
! 93 	case 0x6:
! 94 		executeProgram(BX,CX,DX);
.27:
! Debug: list int DX = [S+6+8] (used reg = )
push	$A[bp]
! Debug: list int CX = [S+8+6] (used reg = )
push	8[bp]
! Debug: list int BX = [S+$A+4] (used reg = )
push	6[bp]
! Debug: func () void = executeProgram+0 (used reg = )
call	_executeProgram
add	sp,*6
!BCC_EOS
! 95 		break;
jmp .1B
!BCC_EOS
! 96 	default:
! 97 		printString("Invalid interrupt");
.28:
! Debug: list * char = .29+0 (used reg = )
mov	bx,#.29
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 98 	}
! 99 }
jmp .1B
.1D:
sub	ax,*0
jl 	.28
cmp	ax,*7
ja  	.2A
shl	ax,*1
mov	bx,ax
seg	cs
br	.2B[bx]
.2B:
.word	.20
.word	.22
.word	.23
.word	.24
.word	.25
.word	.26
.word	.27
.word	.1E
.2A:
jmp	.28
.1B:
..FFFF	=	-6
pop	si
pop	di
pop	bp
ret
! 100 
! 101 void printString(string)
! Register BX used in function handleInterrupt21
! 102 # 101 "kernel.c"
! 101 char *string;
export	_printString
_printString:
!BCC_EOS
! 102 # 101 "kernel.c"
! 101 {
! 102 	char * pointer = string;
push	bp
mov	bp,sp
push	di
push	si
dec	sp
dec	sp
! Debug: eq * char string = [S+8+2] to * char pointer = [S+8-8] (used reg = )
mov	bx,4[bp]
mov	-6[bp],bx
!BCC_EOS
! 103 
! 104 	
! 105 	while (*pointer != 0x00) {
jmp .2D
.2E:
! 106 		interrupt(0x10,0x0e00 + *pointer,0x000F,0,0);	
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $F (used reg = )
mov	ax,*$F
push	ax
mov	bx,-6[bp]
! Debug: add char = [bx+0] to int = const $E00 (used reg = )
! Debug: expression subtree swapping
mov	al,[bx]
xor	ah,ah
! Debug: list int = ax+$E00 (used reg = )
add	ax,#$E00
push	ax
! Debug: list int = const $10 (used reg = )
mov	ax,*$10
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 107 		pointer++;
! Debug: postinc * char pointer = [S+8-8] (used reg = )
mov	bx,-6[bp]
inc	bx
mov	-6[bp],bx
!BCC_EOS
! 108 	}
! 109 }
.2D:
mov	bx,-6[bp]
! Debug: ne int = const 0 to char = [bx+0] (used reg = )
mov	al,[bx]
test	al,al
jne	.2E
.2F:
.2C:
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
! 110 
! 111 void readString(string)
! Register BX used in function printString
! 112 # 111 "kernel.c"
! 111 char *string;
export	_readString
_readString:
!BCC_EOS
! 112 # 111 "kernel.c"
! 111 {
! 112 	
! 113 	int charInput = interrupt(0x16,0,0,0,0);
push	bp
mov	bp,sp
push	di
push	si
dec	sp
dec	sp
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $16 (used reg = )
mov	ax,*$16
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
! Debug: eq int = ax+0 to int charInput = [S+8-8] (used reg = )
mov	-6[bp],ax
!BCC_EOS
! 114 
! 115 	
! 116 	int pos = 0;
dec	sp
dec	sp
! Debug: eq int = const 0 to int pos = [S+$A-$A] (used reg = )
xor	ax,ax
mov	-8[bp],ax
!BCC_EOS
! 117 
! 118 	while (charInput != '\r') {
br 	.31
.32:
! 119 		
! 120 		if (charInput != '\b'
! 120 )
! Debug: ne int = const 8 to int charInput = [S+$A-8] (used reg = )
mov	ax,-6[bp]
cmp	ax,*8
je  	.33
.34:
! 121 		{
! 122 			string[pos++] = charInput;
! Debug: postinc int pos = [S+$A-$A] (used reg = )
mov	ax,-8[bp]
inc	ax
mov	-8[bp],ax
! Debug: ptradd int = ax-1 to * char string = [S+$A+2] (used reg = )
dec	ax
add	ax,4[bp]
mov	bx,ax
! Debug: eq int charInput = [S+$A-8] to char = [bx+0] (used reg = )
mov	al,-6[bp]
mov	[bx],al
!BCC_EOS
! 123 			interrupt(0x10,0xe00 + charInput,0xF,0,0);	
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $F (used reg = )
mov	ax,*$F
push	ax
! Debug: add int charInput = [S+$10-8] to int = const $E00 (used reg = )
! Debug: expression subtree swapping
mov	ax,-6[bp]
! Debug: list int = ax+$E00 (used reg = )
add	ax,#$E00
push	ax
! Debug: list int = const $10 (used reg = )
mov	ax,*$10
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 124 		}
! 125 		
! 126 		else if(pos>0)
jmp .35
.33:
! Debug: gt int = const 0 to int pos = [S+$A-$A] (used reg = )
mov	ax,-8[bp]
test	ax,ax
jle 	.36
.37:
! 127 		{
! 128 			
! 129 			interrupt(0x10,0xe00 + '\b',0xF,0,0);	
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $F (used reg = )
mov	ax,*$F
push	ax
! Debug: list int = const $E08 (used reg = )
mov	ax,#$E08
push	ax
! Debug: list int = const $10 (used reg = )
mov	ax,*$10
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 130 			interrupt(0x10,0xe00 + ' ',0xF,0,0);	
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $F (used reg = )
mov	ax,*$F
push	ax
! Debug: list int = const $E20 (used reg = )
mov	ax,#$E20
push	ax
! Debug: list int = const $10 (used reg = )
mov	ax,*$10
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 131 			interrupt(0x10,0xe00 + '\b',0xF,0,0);	
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $F (used reg = )
mov	ax,*$F
push	ax
! Debug: list int = const $E08 (used reg = )
mov	ax,#$E08
push	ax
! Debug: list int = const $10 (used reg = )
mov	ax,*$10
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 132 			
! 133 			
! 134 			string[--pos] = 0;
! Debug: predec int pos = [S+$A-$A] (used reg = )
mov	ax,-8[bp]
dec	ax
mov	-8[bp],ax
! Debug: ptradd int = ax+0 to * char string = [S+$A+2] (used reg = )
add	ax,4[bp]
mov	bx,ax
! Debug: eq int = const 0 to char = [bx+0] (used reg = )
xor	al,al
mov	[bx],al
!BCC_EOS
! 135 		}
! 136 		charInput = interrupt(0x16,0,0,0,0);		
.36:
.35:
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $16 (used reg = )
mov	ax,*$16
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
! Debug: eq int = ax+0 to int charInput = [S+$A-8] (used reg = )
mov	-6[bp],ax
!BCC_EOS
! 137 	} 
! 138 	
! 139 	interrupt(0x10,0xe00 + '\n',0xF,0,0);		
.31:
! Debug: ne int = const $D to int charInput = [S+$A-8] (used reg = )
mov	ax,-6[bp]
cmp	ax,*$D
bne 	.32
.38:
.30:
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $F (used reg = )
mov	ax,*$F
push	ax
! Debug: list int = const $E0A (used reg = )
mov	ax,#$E0A
push	ax
! Debug: list int = const $10 (used reg = )
mov	ax,*$10
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 140 	interrupt(0x10,0xe00 + '\r',0xF,0,0);		
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const 0 (used reg = )
xor	ax,ax
push	ax
! Debug: list int = const $F (used reg = )
mov	ax,*$F
push	ax
! Debug: list int = const $E0D (used reg = )
mov	ax,#$E0D
push	ax
! Debug: list int = const $10 (used reg = )
mov	ax,*$10
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 141 
! 142 	string[pos] = 0;
! Debug: ptradd int pos = [S+$A-$A] to * char string = [S+$A+2] (used reg = )
mov	ax,-8[bp]
add	ax,4[bp]
mov	bx,ax
! Debug: eq int = const 0 to char = [bx+0] (used reg = )
xor	al,al
mov	[bx],al
!BCC_EOS
! 143 }
add	sp,*4
pop	si
pop	di
pop	bp
ret
! 144 
! 145 void readSector(buffer,sector)
! Register BX used in function readString
! 146 # 145 "kernel.c"
! 145 char *buffer;
export	_readSector
_readSector:
!BCC_EOS
! 146 # 145 "kernel.c"
! 145 int sector;
!BCC_EOS
! 146 # 145 "kernel.c"
! 145 {
! 146 	
! 147 	interrupt(0x13,0x201,buffer,div(sector,36)* 0x100 + mod(sector,18)+ 1,mod(div(sector,18),2)* 0x100);
push	bp
mov	bp,sp
push	di
push	si
! Debug: list int = const 2 (used reg = )
mov	ax,*2
push	ax
! Debug: list int = const $12 (used reg = )
mov	ax,*$12
push	ax
! Debug: list int sector = [S+$A+4] (used reg = )
push	6[bp]
! Debug: func () int = div+0 (used reg = )
call	_div
add	sp,*4
! Debug: list int = ax+0 (used reg = )
push	ax
! Debug: func () int = mod+0 (used reg = )
call	_mod
add	sp,*4
! Debug: mul int = const $100 to int = ax+0 (used reg = )
mov	cx,#$100
imul	cx
! Debug: list int = ax+0 (used reg = )
push	ax
! Debug: list int = const $12 (used reg = )
mov	ax,*$12
push	ax
! Debug: list int sector = [S+$A+4] (used reg = )
push	6[bp]
! Debug: func () int = mod+0 (used reg = )
call	_mod
add	sp,*4
push	ax
! Debug: list int = const $24 (used reg = )
mov	ax,*$24
push	ax
! Debug: list int sector = [S+$C+4] (used reg = )
push	6[bp]
! Debug: func () int = div+0 (used reg = )
call	_div
add	sp,*4
! Debug: mul int = const $100 to int = ax+0 (used reg = )
mov	cx,#$100
imul	cx
! Debug: add int (temp) = [S+$A-$A] to int = ax+0 (used reg = )
add	ax,-8[bp]
inc	sp
inc	sp
! Debug: add int = const 1 to int = ax+0 (used reg = )
! Debug: list int = ax+1 (used reg = )
inc	ax
push	ax
! Debug: list * char buffer = [S+$A+2] (used reg = )
push	4[bp]
! Debug: list int = const $201 (used reg = )
mov	ax,#$201
push	ax
! Debug: list int = const $13 (used reg = )
mov	ax,*$13
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 148 }
pop	si
pop	di
pop	bp
ret
! 149 
! 150 void writeSector(buffer,sector)
! 151 # 150 "kernel.c"
! 150 char *buffer;
export	_writeSector
_writeSector:
!BCC_EOS
! 151 # 150 "kernel.c"
! 150 int sector;
!BCC_EOS
! 151 # 150 "kernel.c"
! 150 {
! 151 	
! 152 	interrupt(0x13,0x301,buffer,div(sector,36)* 0x100 + mod(sector,18)+ 1,mod(div(sector,18),2)* 0x100);
push	bp
mov	bp,sp
push	di
push	si
! Debug: list int = const 2 (used reg = )
mov	ax,*2
push	ax
! Debug: list int = const $12 (used reg = )
mov	ax,*$12
push	ax
! Debug: list int sector = [S+$A+4] (used reg = )
push	6[bp]
! Debug: func () int = div+0 (used reg = )
call	_div
add	sp,*4
! Debug: list int = ax+0 (used reg = )
push	ax
! Debug: func () int = mod+0 (used reg = )
call	_mod
add	sp,*4
! Debug: mul int = const $100 to int = ax+0 (used reg = )
mov	cx,#$100
imul	cx
! Debug: list int = ax+0 (used reg = )
push	ax
! Debug: list int = const $12 (used reg = )
mov	ax,*$12
push	ax
! Debug: list int sector = [S+$A+4] (used reg = )
push	6[bp]
! Debug: func () int = mod+0 (used reg = )
call	_mod
add	sp,*4
push	ax
! Debug: list int = const $24 (used reg = )
mov	ax,*$24
push	ax
! Debug: list int sector = [S+$C+4] (used reg = )
push	6[bp]
! Debug: func () int = div+0 (used reg = )
call	_div
add	sp,*4
! Debug: mul int = const $100 to int = ax+0 (used reg = )
mov	cx,#$100
imul	cx
! Debug: add int (temp) = [S+$A-$A] to int = ax+0 (used reg = )
add	ax,-8[bp]
inc	sp
inc	sp
! Debug: add int = const 1 to int = ax+0 (used reg = )
! Debug: list int = ax+1 (used reg = )
inc	ax
push	ax
! Debug: list * char buffer = [S+$A+2] (used reg = )
push	4[bp]
! Debug: list int = const $301 (used reg = )
mov	ax,#$301
push	ax
! Debug: list int = const $13 (used reg = )
mov	ax,*$13
push	ax
! Debug: func () int = interrupt+0 (used reg = )
call	_interrupt
add	sp,*$A
!BCC_EOS
! 153 }
pop	si
pop	di
pop	bp
ret
! 154 
! 155 int div(a,b)
! 156 # 155 "kernel.c"
! 155 int a;
export	_div
_div:
!BCC_EOS
! 156 # 155 "kernel.c"
! 155 int b;
!BCC_EOS
! 156 # 155 "kernel.c"
! 155 {
! 156 	int x = 0;
push	bp
mov	bp,sp
push	di
push	si
dec	sp
dec	sp
! Debug: eq int = const 0 to int x = [S+8-8] (used reg = )
xor	ax,ax
mov	-6[bp],ax
!BCC_EOS
! 157 	while (a > b) {
jmp .3A
.3B:
! 158 		a -= b;
! Debug: subab int b = [S+8+4] to int a = [S+8+2] (used reg = )
mov	ax,4[bp]
sub	ax,6[bp]
mov	4[bp],ax
!BCC_EOS
! 159 		x++;
! Debug: postinc int x = [S+8-8] (used reg = )
mov	ax,-6[bp]
inc	ax
mov	-6[bp],ax
!BCC_EOS
! 160 	}
! 161 	return x;
.3A:
! Debug: gt int b = [S+8+4] to int a = [S+8+2] (used reg = )
mov	ax,4[bp]
cmp	ax,6[bp]
jg 	.3B
.3C:
.39:
mov	ax,-6[bp]
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 162 }
! 163 
! 164 int mod(a,b)
! 165 # 164 "kernel.c"
! 164 int a;
export	_mod
_mod:
!BCC_EOS
! 165 # 164 "kernel.c"
! 164 int b;
!BCC_EOS
! 165 # 164 "kernel.c"
! 164 {
! 165 	while (a > b) {
push	bp
mov	bp,sp
push	di
push	si
jmp .3E
.3F:
! 166 		a -= b;
! Debug: subab int b = [S+6+4] to int a = [S+6+2] (used reg = )
mov	ax,4[bp]
sub	ax,6[bp]
mov	4[bp],ax
!BCC_EOS
! 167 	}
! 168 	return a;
.3E:
! Debug: gt int b = [S+6+4] to int a = [S+6+2] (used reg = )
mov	ax,4[bp]
cmp	ax,6[bp]
jg 	.3F
.40:
.3D:
mov	ax,4[bp]
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 169 }
! 170 
! 171 void clear(buffer,length)
! 172 # 171 "kernel.c"
! 171 char *buffer;
export	_clear
_clear:
!BCC_EOS
! 172 # 171 "kernel.c"
! 171 int length;
!BCC_EOS
! 172 # 171 "kernel.c"
! 171 {
! 172 	int i;
!BCC_EOS
! 173 	for (i = 0; i < length; i++) {
push	bp
mov	bp,sp
push	di
push	si
dec	sp
dec	sp
! Debug: eq int = const 0 to int i = [S+8-8] (used reg = )
xor	ax,ax
mov	-6[bp],ax
!BCC_EOS
!BCC_EOS
jmp .43
.44:
! 174 		buffer[i] = 0;
! Debug: ptradd int i = [S+8-8] to * char buffer = [S+8+2] (used reg = )
mov	ax,-6[bp]
add	ax,4[bp]
mov	bx,ax
! Debug: eq int = const 0 to char = [bx+0] (used reg = )
xor	al,al
mov	[bx],al
!BCC_EOS
! 175 	}
! 176 }
.42:
! Debug: postinc int i = [S+8-8] (used reg = )
mov	ax,-6[bp]
inc	ax
mov	-6[bp],ax
.43:
! Debug: lt int length = [S+8+4] to int i = [S+8-8] (used reg = )
mov	ax,-6[bp]
cmp	ax,6[bp]
jl 	.44
.45:
.41:
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
! 177 
! 178 void writeFile(buffer,filename,sectors)
! Register BX used in function clear
! 179 # 178 "kernel.c"
! 178 char *buffer;
export	_writeFile
_writeFile:
!BCC_EOS
! 179 # 178 "kernel.c"
! 178 char *filename;
!BCC_EOS
! 179 # 178 "kernel.c"
! 178 int *sectors;
!BCC_EOS
! 179 # 178 "kernel.c"
! 178 {
! 179 	char map[512];
!BCC_EOS
! 180 	char dir[512];
!BCC_EOS
! 181 	int fileId;
!BCC_EOS
! 182 	int filenamePos;
!BCC_EOS
! 183 	int sectorToWrite;
!BCC_EOS
! 184 	int i;
!BCC_EOS
! 185 
! 186 	
! 187 	
! 188 	readSector(map,1);
push	bp
mov	bp,sp
push	di
push	si
add	sp,#-$408
! Debug: list int = const 1 (used reg = )
mov	ax,*1
push	ax
! Debug: list * char map = S+$410-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () void = readSector+0 (used reg = )
call	_readSector
add	sp,*4
!BCC_EOS
! 189 	readSector(dir,2);
! Debug: list int = const 2 (used reg = )
mov	ax,*2
push	ax
! Debug: list * char dir = S+$410-$406 (used reg = )
lea	bx,-$404[bp]
push	bx
! Debug: func () void = readSector+0 (used reg = )
call	_readSector
add	sp,*4
!BCC_EOS
! 190 
! 191 	
! 192 	for (fileId = 0; fileId < 16; fileId++) {
! Debug: eq int = const 0 to int fileId = [S+$40E-$408] (used reg = )
xor	ax,ax
mov	-$406[bp],ax
!BCC_EOS
!BCC_EOS
jmp .48
.49:
! 193 		
! 194 		filenamePos = fileId * 32;
! Debug: mul int = const $20 to int fileId = [S+$40E-$408] (used reg = )
mov	ax,-$406[bp]
mov	cl,*5
shl	ax,cl
! Debug: eq int = ax+0 to int filenamePos = [S+$40E-$40A] (used reg = )
mov	-$408[bp],ax
!BCC_EOS
! 195 
! 196 		
! 197 		if (dir[filenamePos] == 0) {
! Debug: ptradd int filenamePos = [S+$40E-$40A] to [$200] char dir = S+$40E-$406 (used reg = )
mov	ax,-$408[bp]
mov	bx,bp
add	bx,ax
! Debug: logeq int = const 0 to char = [bx-$404] (used reg = )
mov	al,-$404[bx]
test	al,al
jne 	.4A
.4B:
! 198 			break;
jmp .46
!BCC_EOS
! 199 		}
! 200 	}
.4A:
! 201 
! 202 	
! 203 	if (fileId == 16) {
.47:
! Debug: postinc int fileId = [S+$40E-$408] (used reg = )
mov	ax,-$406[bp]
inc	ax
mov	-$406[bp],ax
.48:
! Debug: lt int = const $10 to int fileId = [S+$40E-$408] (used reg = )
mov	ax,-$406[bp]
cmp	ax,*$10
jl 	.49
.4C:
.46:
! Debug: logeq int = const $10 to int fileId = [S+$40E-$408] (used reg = )
mov	ax,-$406[bp]
cmp	ax,*$10
jne 	.4D
.4E:
! 204 		printString("Failed to write file, file limit reached");
! Debug: list * char = .4F+0 (used reg = )
mov	bx,#.4F
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 205 		return;
lea	sp,-4[bp]
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 206 	}
! 207 
! 208 	
! 209 	if (getEmptySectorCount(map,256)< *sectors) {
.4D:
! Debug: list int = const $100 (used reg = )
mov	ax,#$100
push	ax
! Debug: list * char map = S+$410-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () int = getEmptySectorCount+0 (used reg = )
call	_getEmptySectorCount
add	sp,*4
mov	bx,8[bp]
! Debug: lt int = [bx+0] to int = ax+0 (used reg = )
cmp	ax,[bx]
jge 	.50
.51:
! 210 		
! 211 		printString("Failed to write file, sector limit reached");
! Debug: list * char = .52+0 (used reg = )
mov	bx,#.52
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 212 		return;
lea	sp,-4[bp]
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 213 	}
! 214 
! 215 	
! 216 	clear(dir + fileId * 32,12);
.50:
! Debug: list int = const $C (used reg = )
mov	ax,*$C
push	ax
! Debug: mul int = const $20 to int fileId = [S+$410-$408] (used reg = )
mov	ax,-$406[bp]
mov	cl,*5
shl	ax,cl
! Debug: ptradd int = ax+0 to [$200] char dir = S+$410-$406 (used reg = )
mov	bx,bp
add	bx,ax
! Debug: cast * char = const 0 to [$200] char = bx-$404 (used reg = )
! Debug: list * char = bx-$404 (used reg = )
add	bx,#-$404
push	bx
! Debug: func () void = clear+0 (used reg = )
call	_clear
add	sp,*4
!BCC_EOS
! 217 
! 218 	
! 219 	for (i = 0; i < 12; i++) {
! Debug: eq int = const 0 to int i = [S+$40E-$40E] (used reg = )
xor	ax,ax
mov	-$40C[bp],ax
!BCC_EOS
!BCC_EOS
jmp .55
.56:
! 220 		if (filename[i] == 0) {
! Debug: ptradd int i = [S+$40E-$40E] to * char filename = [S+$40E+4] (used reg = )
mov	ax,-$40C[bp]
add	ax,6[bp]
mov	bx,ax
! Debug: logeq int = const 0 to char = [bx+0] (used reg = )
mov	al,[bx]
test	al,al
jne 	.57
.58:
! 221 			break;
jmp .53
!BCC_EOS
! 222 		}
! 223 		dir[
.57:
! 223 fileId * 32 + i] = filename[i];
! Debug: ptradd int i = [S+$40E-$40E] to * char filename = [S+$40E+4] (used reg = )
mov	ax,-$40C[bp]
add	ax,6[bp]
mov	bx,ax
! Debug: mul int = const $20 to int fileId = [S+$40E-$408] (used reg = bx)
mov	ax,-$406[bp]
mov	cl,*5
shl	ax,cl
! Debug: add int i = [S+$40E-$40E] to int = ax+0 (used reg = bx)
add	ax,-$40C[bp]
! Debug: ptradd int = ax+0 to [$200] char dir = S+$40E-$406 (used reg = bx)
mov	si,bp
add	si,ax
! Debug: eq char = [bx+0] to char = [si-$404] (used reg = )
mov	al,[bx]
mov	-$404[si],al
!BCC_EOS
! 224 	}
! 225 
! 226 	
! 227 	for (i = 0; i < *sectors; i++) {
.54:
! Debug: postinc int i = [S+$40E-$40E] (used reg = )
mov	ax,-$40C[bp]
inc	ax
mov	-$40C[bp],ax
.55:
! Debug: lt int = const $C to int i = [S+$40E-$40E] (used reg = )
mov	ax,-$40C[bp]
cmp	ax,*$C
jl 	.56
.59:
.53:
! Debug: eq int = const 0 to int i = [S+$40E-$40E] (used reg = )
xor	ax,ax
mov	-$40C[bp],ax
!BCC_EOS
!BCC_EOS
jmp .5C
.5D:
! 228 		
! 229 		sectorToWrite = getFirstEmptySector(map,256);
! Debug: list int = const $100 (used reg = )
mov	ax,#$100
push	ax
! Debug: list * char map = S+$410-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () int = getFirstEmptySector+0 (used reg = )
call	_getFirstEmptySector
add	sp,*4
! Debug: eq int = ax+0 to int sectorToWrite = [S+$40E-$40C] (used reg = )
mov	-$40A[bp],ax
!BCC_EOS
! 230 		
! 231 		
! 232 		writeSector(buffer + 512 * i,sectorToWrite);
! Debug: list int sectorToWrite = [S+$40E-$40C] (used reg = )
push	-$40A[bp]
! Debug: mul int i = [S+$410-$40E] to int = const $200 (used reg = )
! Debug: expression subtree swapping
mov	ax,-$40C[bp]
mov	cx,#$200
imul	cx
! Debug: ptradd int = ax+0 to * char buffer = [S+$410+2] (used reg = )
add	ax,4[bp]
! Debug: list * char = ax+0 (used reg = )
push	ax
! Debug: func () void = writeSector+0 (used reg = )
call	_writeSector
add	sp,*4
!BCC_EOS
! 233 
! 234 		
! 235 		map[sectorToWrite] = 0xFF;
! Debug: ptradd int sectorToWrite = [S+$40E-$40C] to [$200] char map = S+$40E-$206 (used reg = )
mov	ax,-$40A[bp]
mov	bx,bp
add	bx,ax
! Debug: eq int = const $FF to char = [bx-$204] (used reg = )
mov	al,#$FF
mov	-$204[bx],al
!BCC_EOS
! 236 
! 237 		
! 238 		dir[fileId * 32 + 12 + i] = sectorToWrite;
! Debug: mul int = const $20 to int fileId = [S+$40E-$408] (used reg = )
mov	ax,-$406[bp]
mov	cl,*5
shl	ax,cl
! Debug: add int = const $C to int = ax+0 (used reg = )
! Debug: add int i = [S+$40E-$40E] to int = ax+$C (used reg = )
add	ax,*$C
add	ax,-$40C[bp]
! Debug: ptradd int = ax+0 to [$200] char dir = S+$40E-$406 (used reg = )
mov	bx,bp
add	bx,ax
! Debug: eq int sectorToWrite = [S+$40E-$40C] to char = [bx-$404] (used reg = )
mov	al,-$40A[bp]
mov	-$404[bx],al
!BCC_EOS
! 239 	}
! 240 
! 241 	
! 242 	writeSector(map,1);
.5B:
! Debug: postinc int i = [S+$40E-$40E] (used reg = )
mov	ax,-$40C[bp]
inc	ax
mov	-$40C[bp],ax
.5C:
mov	bx,8[bp]
! Debug: lt int = [bx+0] to int i = [S+$40E-$40E] (used reg = )
mov	ax,-$40C[bp]
cmp	ax,[bx]
jl 	.5D
.5E:
.5A:
! Debug: list int = const 1 (used reg = )
mov	ax,*1
push	ax
! Debug: list * char map = S+$410-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () void = writeSector+0 (used reg = )
call	_writeSector
add	sp,*4
!BCC_EOS
! 243 	writeSector(dir,2);
! Debug: list int = const 2 (used reg = )
mov	ax,*2
push	ax
! Debug: list * char dir = S+$410-$406 (used reg = )
lea	bx,-$404[bp]
push	bx
! Debug: func () void = writeSector+0 (used reg = )
call	_writeSector
add	sp,*4
!BCC_EOS
! 244 }
lea	sp,-4[bp]
pop	si
pop	di
pop	bp
ret
! 245 
! 246 int getEmptySectorCount(buffer,sectors)
! Register BX SI used in function writeFile
! 247 # 246 "kernel.c"
! 246 char *buffer;
export	_getEmptySectorCount
_getEmptySectorCount:
!BCC_EOS
! 247 # 246 "kernel.c"
! 246 int sectors;
!BCC_EOS
! 247 # 246 "kernel.c"
! 246 {
! 247 	int count;
!BCC_EOS
! 248 	int i;
!BCC_EOS
! 249 
! 250 	count = 0;
push	bp
mov	bp,sp
push	di
push	si
add	sp,*-4
! Debug: eq int = const 0 to int count = [S+$A-8] (used reg = )
xor	ax,ax
mov	-6[bp],ax
!BCC_EOS
! 251 	for (i = 0; i < sectors; i++) {
! Debug: eq int = const 0 to int i = [S+$A-$A] (used reg = )
xor	ax,ax
mov	-8[bp],ax
!BCC_EOS
!BCC_EOS
jmp .61
.62:
! 252 		if (buffer[i] == 0x00) {
! Debug: ptradd int i = [S+$A-$A] to * char buffer = [S+$A+2] (used reg = )
mov	ax,-8[bp]
add	ax,4[bp]
mov	bx,ax
! Debug: logeq int = const 0 to char = [bx+0] (used reg = )
mov	al,[bx]
test	al,al
jne 	.63
.64:
! 253 			count++;
! Debug: postinc int count = [S+$A-8] (used reg = )
mov	ax,-6[bp]
inc	ax
mov	-6[bp],ax
!BCC_EOS
! 254 		}
! 255 	}
.63:
! 256 	return count;
.60:
! Debug: postinc int i = [S+$A-$A] (used reg = )
mov	ax,-8[bp]
inc	ax
mov	-8[bp],ax
.61:
! Debug: lt int sectors = [S+$A+4] to int i = [S+$A-$A] (used reg = )
mov	ax,-8[bp]
cmp	ax,6[bp]
jl 	.62
.65:
.5F:
mov	ax,-6[bp]
add	sp,*4
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 257 }
! 258 
! 259 int getFirstEmptySector(buffer,sectors)
! Register BX used in function getEmptySectorCount
! 260 # 259 "kernel.c"
! 259 char *buffer;
export	_getFirstEmptySector
_getFirstEmptySector:
!BCC_EOS
! 260 # 259 "kernel.c"
! 259 int sectors;
!BCC_EOS
! 260 # 259 "kernel.c"
! 259 {
! 260 	int i;
!BCC_EOS
! 261 	for (i = 0; i < sectors; i++) {
push	bp
mov	bp,sp
push	di
push	si
dec	sp
dec	sp
! Debug: eq int = const 0 to int i = [S+8-8] (used reg = )
xor	ax,ax
mov	-6[bp],ax
!BCC_EOS
!BCC_EOS
jmp .68
.69:
! 262 		if (buffer[i] == 0x00) {
! Debug: ptradd int i = [S+8-8] to * char buffer = [S+8+2] (used reg = )
mov	ax,-6[bp]
add	ax,4[bp]
mov	bx,ax
! Debug: logeq int = const 0 to char = [bx+0] (used reg = )
mov	al,[bx]
test	al,al
jne 	.6A
.6B:
! 263 			return i;
mov	ax,-6[bp]
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 264 		}
! 265 	}
.6A:
! 266 }
.67:
! Debug: postinc int i = [S+8-8] (used reg = )
mov	ax,-6[bp]
inc	ax
mov	-6[bp],ax
.68:
! Debug: lt int sectors = [S+8+4] to int i = [S+8-8] (used reg = )
mov	ax,-6[bp]
cmp	ax,6[bp]
jl 	.69
.6C:
.66:
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
! 267 
! 268 void readFile(buffer,filename,success)
! Register BX used in function getFirstEmptySector
! 269 # 268 "kernel.c"
! 268 char *buffer;
export	_readFile
_readFile:
!BCC_EOS
! 269 # 268 "kernel.c"
! 268 char *filename;
!BCC_EOS
! 269 # 268 "kernel.c"
! 268 int *success;
!BCC_EOS
! 269 # 268 "kernel.c"
! 268 {
! 269 	char dir[512];
!BCC_EOS
! 270 	int entry;
!BCC_EOS
! 271 	int noSector;
!BCC_EOS
! 272 	int dirPos;
!BCC_EOS
! 273 	
! 274 	
! 275 	readSector(dir,2);
push	bp
mov	bp,sp
push	di
push	si
add	sp,#-$206
! Debug: list int = const 2 (used reg = )
mov	ax,*2
push	ax
! Debug: list * char dir = S+$20E-$206 (used reg = )
lea	bx,-$204[bp]
push	bx
! Debug: func () void = readSector+0 (used reg = )
call	_readSector
add	sp,*4
!BCC_EOS
! 276 
! 277 	
! 278 	for (entry = 0; entry < 16; entry++) {
! Debug: eq int = const 0 to int entry = [S+$20C-$208] (used reg = )
xor	ax,ax
mov	-$206[bp],ax
!BCC_EOS
!BCC_EOS
jmp .6F
.70:
! 279 		if (isStringEqual(dir + entry * 32,filename,12)== 1) {
! Debug: list int = const $C (used reg = )
mov	ax,*$C
push	ax
! Debug: list * char filename = [S+$20E+4] (used reg = )
push	6[bp]
! Debug: mul int = const $20 to int entry = [S+$210-$208] (used reg = )
mov	ax,-$206[bp]
mov	cl,*5
shl	ax,cl
! Debug: ptradd int = ax+0 to [$200] char dir = S+$210-$206 (used reg = )
mov	bx,bp
add	bx,ax
! Debug: cast * char = const 0 to [$200] char = bx-$204 (used reg = )
! Debug: list * char = bx-$204 (used reg = )
add	bx,#-$204
push	bx
! Debug: func () char = isStringEqual+0 (used reg = )
call	_isStringEqual
add	sp,*6
! Debug: logeq int = const 1 to char = al+0 (used reg = )
cmp	al,*1
jne 	.71
.72:
! 280 			break;
jmp .6D
!BCC_EOS
! 281 		}
! 282 	}
.71:
! 283 
! 284 	
! 285 	if (entry == 16) {
.6E:
! Debug: postinc int entry = [S+$20C-$208] (used reg = )
mov	ax,-$206[bp]
inc	ax
mov	-$206[bp],ax
.6F:
! Debug: lt int = const $10 to int entry = [S+$20C-$208] (used reg = )
mov	ax,-$206[bp]
cmp	ax,*$10
jl 	.70
.73:
.6D:
! Debug: logeq int = const $10 to int entry = [S+$20C-$208] (used reg = )
mov	ax,-$206[bp]
cmp	ax,*$10
jne 	.74
.75:
! 286 		printString("Failed to read file, no file found\n\r");
! Debug: list * char = .76+0 (used reg = )
mov	bx,#.76
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 287 		*success = 0;
mov	bx,8[bp]
! Debug: eq int = const 0 to int = [bx+0] (used reg = )
xor	ax,ax
mov	[bx],ax
!BCC_EOS
! 288 		return;
lea	sp,-4[bp]
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 289 	}
! 290 
! 291 	printString("File found, reading file\n\r");
.74:
! Debug: list * char = .77+0 (used reg = )
mov	bx,#.77
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 292 	
! 293 	for (noSector = 0; noSector < 20; noSector++) {
! Debug: eq int = const 0 to int noSector = [S+$20C-$20A] (used reg = )
xor	ax,ax
mov	-$208[bp],ax
!BCC_EOS
!BCC_EOS
jmp .7A
.7B:
! 294 		dirPos = entry * 32 + 12 + noSector;
! Debug: mul int = const $20 to int entry = [S+$20C-$208] (used reg = )
mov	ax,-$206[bp]
mov	cl,*5
shl	ax,cl
! Debug: add int = const $C to int = ax+0 (used reg = )
! Debug: add int noSector = [S+$20C-$20A] to int = ax+$C (used reg = )
add	ax,*$C
add	ax,-$208[bp]
! Debug: eq int = ax+0 to int dirPos = [S+$20C-$20C] (used reg = )
mov	-$20A[bp],ax
!BCC_EOS
! 295 		if (dir[dirPos] == 0) {
! Debug: ptradd int dirPos = [S+$20C-$20C] to [$200] char dir = S+$20C-$206 (used reg = )
mov	ax,-$20A[bp]
mov	bx,bp
add	bx,ax
! Debug: logeq int = const 0 to char = [bx-$204] (used reg = )
mov	al,-$204[bx]
test	al,al
jne 	.7C
.7D:
! 296 			printString("End of file..\n\r");
! Debug: list * char = .7E+0 (used reg = )
mov	bx,#.7E
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 297 			break;
jmp .78
!BCC_EOS
! 298 		}
! 299 		printString("Reading sector...\n\r");
.7C:
! Debug: list * char = .7F+0 (used reg = )
mov	bx,#.7F
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 300 		readSector(buffer + noSector * 512,dir[dirPos]);
! Debug: ptradd int dirPos = [S+$20C-$20C] to [$200] char dir = S+$20C-$206 (used reg = )
mov	ax,-$20A[bp]
mov	bx,bp
add	bx,ax
! Debug: list char = [bx-$204] (used reg = )
mov	al,-$204[bx]
xor	ah,ah
push	ax
! Debug: mul int = const $200 to int noSector = [S+$20E-$20A] (used reg = )
mov	ax,-$208[bp]
mov	cx,#$200
imul	cx
! Debug: ptradd int = ax+0 to * char buffer = [S+$20E+2] (used reg = )
add	ax,4[bp]
! Debug: list * char = ax+0 (used reg = )
push	ax
! Debug: func () void = readSector+0 (used reg = )
call	_readSector
add	sp,*4
!BCC_EOS
! 301 	}
! 302 	
! 303 	*success = 1;
.79:
! Debug: postinc int noSector = [S+$20C-$20A] (used reg = )
mov	ax,-$208[bp]
inc	ax
mov	-$208[bp],ax
.7A:
! Debug: lt int = const $14 to int noSector = [S+$20C-$20A] (used reg = )
mov	ax,-$208[bp]
cmp	ax,*$14
jl 	.7B
.80:
.78:
mov	bx,8[bp]
! Debug: eq int = const 1 to int = [bx+0] (used reg = )
mov	ax,*1
mov	[bx],ax
!BCC_EOS
! 304 }
lea	sp,-4[bp]
pop	si
pop	di
pop	bp
ret
! 305 
! 306 char isStringEqual(a,b,length)
! Register BX used in function readFile
! 307 # 306 "kernel.c"
! 306 char *a;
export	_isStringEqual
_isStringEqual:
!BCC_EOS
! 307 # 306 "kernel.c"
! 306 char *b;
!BCC_EOS
! 307 # 306 "kernel.c"
! 306 int length;
!BCC_EOS
! 307 # 306 "kernel.c"
! 306 {
! 307 	int i;
!BCC_EOS
! 308 
! 309 	for (i = 0; i < length; i++) {
push	bp
mov	bp,sp
push	di
push	si
dec	sp
dec	sp
! Debug: eq int = const 0 to int i = [S+8-8] (used reg = )
xor	ax,ax
mov	-6[bp],ax
!BCC_EOS
!BCC_EOS
jmp .83
.84:
! 310 		if (a[i] != b[i]) {
! Debug: ptradd int i = [S+8-8] to * char b = [S+8+4] (used reg = )
mov	ax,-6[bp]
add	ax,6[bp]
mov	bx,ax
! Debug: ptradd int i = [S+8-8] to * char a = [S+8+2] (used reg = bx)
mov	ax,-6[bp]
add	ax,4[bp]
mov	si,ax
! Debug: ne char = [bx+0] to char = [si+0] (used reg = )
mov	al,[si]
cmp	al,[bx]
je  	.85
.86:
! 311 			return 0;
xor	al,al
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 312 		}
! 313 		if (a[i] == 0) {
.85:
! Debug: ptradd int i = [S+8-8] to * char a = [S+8+2] (used reg = )
mov	ax,-6[bp]
add	ax,4[bp]
mov	bx,ax
! Debug: logeq int = const 0 to char = [bx+0] (used reg = )
mov	al,[bx]
test	al,al
jne 	.87
.88:
! 314 			return 1;
mov	al,*1
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 315 		}
! 316 	}
.87:
! 317 
! 318 	return 1;
.82:
! Debug: postinc int i = [S+8-8] (used reg = )
mov	ax,-6[bp]
inc	ax
mov	-6[bp],ax
.83:
! Debug: lt int length = [S+8+6] to int i = [S+8-8] (used reg = )
mov	ax,-6[bp]
cmp	ax,8[bp]
jl 	.84
.89:
.81:
mov	al,*1
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 319 }
! 320 
! 321 void executeProgram(filename,segment,success)
! Register BX SI used in function isStringEqual
! 322 # 321 "kernel.c"
! 321 char *filename;
export	_executeProgram
_executeProgram:
!BCC_EOS
! 322 # 321 "kernel.c"
! 321 int segment;
!BCC_EOS
! 322 # 321 "kernel.c"
! 321 int *success;
!BCC_EOS
! 322 # 321 "kernel.c"
! 321 {
! 322 	char buffer[512 * 20];
!BCC_EOS
! 323 	int i;
!BCC_EOS
! 324 
! 325 	clear(buffer,512 * 20);
push	bp
mov	bp,sp
push	di
push	si
add	sp,#-$2802
! Debug: list int = const $2800 (used reg = )
mov	ax,#$2800
push	ax
! Debug: list * char buffer = S+$280A-$2806 (used reg = )
lea	bx,-$2804[bp]
push	bx
! Debug: func () void = clear+0 (used reg = )
call	_clear
add	sp,*4
!BCC_EOS
! 326 
! 327 	readFil
! 327 e(buffer,filename,success);
! Debug: list * int success = [S+$2808+6] (used reg = )
push	8[bp]
! Debug: list * char filename = [S+$280A+2] (used reg = )
push	4[bp]
! Debug: list * char buffer = S+$280C-$2806 (used reg = )
lea	bx,-$2804[bp]
push	bx
! Debug: func () void = readFile+0 (used reg = )
call	_readFile
add	sp,*6
!BCC_EOS
! 328 
! 329 	if (*success == 0) {
mov	bx,8[bp]
! Debug: logeq int = const 0 to int = [bx+0] (used reg = )
mov	ax,[bx]
test	ax,ax
jne 	.8A
.8B:
! 330 		printString("Siao a kenot launch edi a...");
! Debug: list * char = .8C+0 (used reg = )
mov	bx,#.8C
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 331 		return;
lea	sp,-4[bp]
pop	si
pop	di
pop	bp
ret
!BCC_EOS
! 332 	}
! 333 
! 334 	for (i = 0; i < 512 * 20; i++) {
.8A:
! Debug: eq int = const 0 to int i = [S+$2808-$2808] (used reg = )
xor	ax,ax
mov	-$2806[bp],ax
!BCC_EOS
!BCC_EOS
jmp .8F
.90:
! 335 		putInMemory(segment,i,buffer[i]);
! Debug: ptradd int i = [S+$2808-$2808] to [$2800] char buffer = S+$2808-$2806 (used reg = )
mov	ax,-$2806[bp]
mov	bx,bp
add	bx,ax
! Debug: list char = [bx-$2804] (used reg = )
mov	al,-$2804[bx]
xor	ah,ah
push	ax
! Debug: list int i = [S+$280A-$2808] (used reg = )
push	-$2806[bp]
! Debug: list int segment = [S+$280C+4] (used reg = )
push	6[bp]
! Debug: func () int = putInMemory+0 (used reg = )
call	_putInMemory
add	sp,*6
!BCC_EOS
! 336 	}
! 337 
! 338 	launchProgram(segment);
.8E:
! Debug: postinc int i = [S+$2808-$2808] (used reg = )
mov	ax,-$2806[bp]
inc	ax
mov	-$2806[bp],ax
.8F:
! Debug: lt int = const $2800 to int i = [S+$2808-$2808] (used reg = )
mov	ax,-$2806[bp]
cmp	ax,#$2800
jl 	.90
.91:
.8D:
! Debug: list int segment = [S+$2808+4] (used reg = )
push	6[bp]
! Debug: func () int = launchProgram+0 (used reg = )
call	_launchProgram
inc	sp
inc	sp
!BCC_EOS
! 339 	
! 340 }
lea	sp,-4[bp]
pop	si
pop	di
pop	bp
ret
! 341 
! 342 void returnToKernel()
! Register BX used in function executeProgram
! 343 # 342 "kernel.c"
! 342 {
export	_returnToKernel
_returnToKernel:
! 343 	int one = 1;
push	bp
mov	bp,sp
push	di
push	si
dec	sp
dec	sp
! Debug: eq int = const 1 to int one = [S+8-8] (used reg = )
mov	ax,*1
mov	-6[bp],ax
!BCC_EOS
! 344 	printString("Jumping to kernel\n\r");
! Debug: list * char = .92+0 (used reg = )
mov	bx,#.92
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 345 	executeProgram("KERNEL",0x3000,&one);
! Debug: list * int one = S+8-8 (used reg = )
lea	bx,-6[bp]
push	bx
! Debug: list int = const $3000 (used reg = )
mov	ax,#$3000
push	ax
! Debug: list * char = .93+0 (used reg = )
mov	bx,#.93
push	bx
! Debug: func () void = executeProgram+0 (used reg = )
call	_executeProgram
add	sp,*6
!BCC_EOS
! 346 }
inc	sp
inc	sp
pop	si
pop	di
pop	bp
ret
! 347 
! 348 void printBootLogo()
! Register BX used in function returnToKernel
! 349 # 348 "kernel.c"
! 348 {
export	_printBootLogo
_printBootLogo:
! 349 	printString("	               ,@@@@@@@,\r\n");
push	bp
mov	bp,sp
push	di
push	si
! Debug: list * char = .94+0 (used reg = )
mov	bx,#.94
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 350 	printString("       ,,,.   ,@@@@@@/@@,  .oo8888o.\r\n");
! Debug: list * char = .95+0 (used reg = )
mov	bx,#.95
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 351 	printString("    ,&%%&%&&%,@@@@@/@@@@@@,8888\\88/8o\r\n");
! Debug: list * char = .96+0 (used reg = )
mov	bx,#.96
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 352 	printString("   ,%&\\%&&%&&%,@@@\\@@@/@@@88\\88888/88'\r\n");
! Debug: list * char = .97+0 (used reg = )
mov	bx,#.97
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 353 	printString("   %&&%&%&/%&&%@@\\@@/ /@@@88888\\88888'\r\n");
! Debug: list * char = .98+0 (used reg = )
mov	bx,#.98
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 354 	printString("   %&&%/ %&%%&&@@\\ V /@@' `88\\8 `/88'\r\n");
! Debug: list * char = .99+0 (used reg = )
mov	bx,#.99
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 355 	printString("   `&%\\ ` /%&'    |.|        \\ '|8'\r\n");
! Debug: list * char = .9A+0 (used reg = )
mov	bx,#.9A
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 356 	printString("//\\ \\/ ._\\//_/__/  ,\\_//__\\/.  \\_//__/_\r\n");
! Debug: list * char = .9B+0 (used reg = )
mov	bx,#.9B
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 357 	printString("     _               _                        \r\n");
! Debug: list * char = .9C+0 (used reg = )
mov	bx,#.9C
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 358 	printString("    | |__  _   _ ___| |__   ___  ___          \r\n");
! Debug: list * char = .9D+0 (used reg = )
mov	bx,#.9D
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 359 	printString("    | '_ \\| | | / __| '_ \\ / _ \\/ __|      \r\n");
! Debug: list * char = .9E+0 (used reg = )
mov	bx,#.9E
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 360 	printString("    | |_) | |_| \\__ \\ | | |  __/\\__ \\     \r\n");
! Debug: list * char = .9F+0 (used reg = )
mov	bx,#.9F
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 361 	printString("    |_.__/ \\__,_|___/_| |_|\\___||___/       \r\n");
! Debug: list * char = .A0+0 (used reg = )
mov	bx,#.A0
push	bx
! Debug: func () void = printString+0 (used reg = )
call	_printString
inc	sp
inc	sp
!BCC_EOS
! 362                                   
! 363 }
pop	si
pop	di
pop	bp
ret
! 364 
! Register BX used in function printBootLogo
.data
.A0:
.A1:
.ascii	"    |_.__/ \\__,_|___/_| |_|\\___||___/   "
.ascii	"    "
.byte	$D,$A
.byte	0
.9F:
.A2:
.ascii	"    | |_) | |_| \\__ \\ | | |  __/\\__ \\   "
.ascii	"  "
.byte	$D,$A
.byte	0
.9E:
.A3:
.ascii	"    | '_ \\| | | / __| '_ \\ / _ \\/ __|   "
.ascii	"   "
.byte	$D,$A
.byte	0
.9D:
.A4:
.ascii	"    | |__  _   _ ___| |__   ___  ___    "
.ascii	"      "
.byte	$D,$A
.byte	0
.9C:
.A5:
.ascii	"     _               _                  "
.ascii	"      "
.byte	$D,$A
.byte	0
.9B:
.A6:
.ascii	"//\\ \\/ ._\\//_/__/  ,\\_//__\\/.  \\_//__/_"
.byte	$D,$A
.byte	0
.9A:
.A7:
.ascii	"   `&%\\ ` /%&'    |.|        \\ '|8'"
.byte	$D,$A
.byte	0
.99:
.A8:
.ascii	"   %&&%/ %&%%&&@@\\ V /@@' `88\\8 `/88'"
.byte	$D,$A
.byte	0
.98:
.A9:
.ascii	"   %&&%&%&/%&&%@@\\@@/ /@@@88888\\88888'"
.byte	$D,$A
.byte	0
.97:
.AA:
.ascii	"   ,%&\\%&&%&&%,@@@\\@@@/@@@88\\88888/88'"
.byte	$D,$A
.byte	0
.96:
.AB:
.ascii	"    ,&%%&%&&%,@@@@@/@@@@@@,8888\\88/8o"
.byte	$D,$A
.byte	0
.95:
.AC:
.ascii	"       ,,,.   ,@@@@@@/@@,  .oo8888o."
.byte	$D,$A
.byte	0
.94:
.AD:
.byte	9
.ascii	"               ,@@@@@@@,"
.byte	$D,$A
.byte	0
.93:
.AE:
.ascii	"KERNEL"
.byte	0
.92:
.AF:
.ascii	"Jumping to kernel"
.byte	$A,$D
.byte	0
.8C:
.B0:
.ascii	"Siao a kenot launch edi a..."
.byte	0
.7F:
.B1:
.ascii	"Reading sector..."
.byte	$A,$D
.byte	0
.7E:
.B2:
.ascii	"End of file.."
.byte	$A,$D
.byte	0
.77:
.B3:
.ascii	"File found, reading file"
.byte	$A,$D
.byte	0
.76:
.B4:
.ascii	"Failed to read file, no file found"
.byte	$A,$D
.byte	0
.52:
.B5:
.ascii	"Failed to write file, sector limit reach"
.ascii	"ed"
.byte	0
.4F:
.B6:
.ascii	"Failed to write file, file limit reached"
.byte	0
.29:
.B7:
.ascii	"Invalid interrupt"
.byte	0
.21:
.B8:
.ascii	"RAN CODE"
.byte	0
.1F:
.B9:
.ascii	"RAN CODE"
.byte	0
.19:
.BA:
.ascii	"milestone1"
.byte	0
.17:
.BB:
.ascii	"milestone1"
.byte	0
.14:
.BC:
.byte	$D,$A
.byte	0
.13:
.BD:
.ascii	"key.txt"
.byte	0
.11:
.BE:
.ascii	"uwu"
.byte	0
.E:
.BF:
.ascii	"hello"
.byte	0
.C:
.C0:
.ascii	"hello"
.byte	0
.9:
.C1:
.ascii	"moo"
.byte	0
.7:
.C2:
.ascii	"moo"
.byte	0
.5:
.C3:
.ascii	"bushes:~ "
.byte	0
.1:
.C4:
.byte	$A
.byte	0
.bss

! 0 errors detected
