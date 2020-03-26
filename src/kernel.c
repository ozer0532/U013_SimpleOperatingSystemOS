// INTERRUPT HANDLING
void handleInterrupt21 (int AX, int BX, int CX, int DX);
void printString(char *string);
void printInteger(int n);
void printHexa(char n);
void readString(char *string);
void readSector(char *buffer, int sector);
void writeSector(char *buffer, int sector);
void readFile(char *buffer, char *path, int *result, char parentIndex);
void clear(char *buffer, int length); //Fungsi untuk mengisi buffer dengan 0
void writeFile(char *buffer, char *path, int *sectorCount, char parentIndex);
void executeProgram(char *filename, int segment, int *success, char parentIndex);
void putchar(int x, int y, char cc, char color);
void printStringFormat(int x, int y, char *string, char color);

int div(int a, int b);
int mod(int a, int b);

int getEmptySectorCount(char *buffer, int sectors);
int getFirstEmptySector(char *buffer, int sectors);

// String ops
char isStringEqual(char *a, char *b, int length);
char isStringStartsWith(char *a, char *b, int length);
int stringLength(char *string, int max);

int getCurrentFolderIndex(char *currentPath);
int getPathIndex(char parentIndex, char *filePath);

// MAIN FUNCTIONS
void printBootLogo();


int main () {
	char command[512];
	// char filename[512];
	// char fileRead[512 * 20];
	int flag = 1;
	int i;

    makeInterrupt21();

	printBootLogo();

	printString("\n");

	// Testing code
	// getPathIndex(0xFF, "pisang");
	// printInteger(getPathIndex(0x00, "../pisang/../abcdef"));
	// while(1) {

	// }

	// What's supposed to be here
	clear(command, 512);
	executeProgram("shell", 0x2000, &flag, 0xFF);
    while (1) {
		printString("Enter a program to execute: ");
    	readString(command);
		executeProgram(command, 0x2000, &flag, 0xFF);
	}
}

void handleInterrupt21 (int AX, int BX, int CX, int DX) {
	char AL, AH;
	AL = (char) (AX);
	AH = (char) (AX >> 8);
	switch (AL) {
		case 0x00:
			printString(BX);
			break;
		case 0x01:
			readString(BX);
			break;
		case 0x02:
			readSector(BX, CX);
			break;
		case 0x03:
			writeSector(BX, CX);
			break;
		case 0x04:
			readFile(BX, CX, DX, AH);
			break;
		case 0x05:
			writeFile(BX, CX, DX, AH);
			break;
		case 0x06:
			executeProgram(BX, CX, DX, AH);
			break;
		default:
			printString("Invalid interrupt");
	}
}

void clear(char *buffer, int length) {
	int i;
	for (i = 0; i < length; i++) {
		buffer[i] = 0;
	}
}

void executeProgram(char *filename, int segment, int *success, char parentIndex) {
	char buffer[512 * 16];
	int i;

	clear(buffer, 512 * 16);

	readFile(buffer, filename, success, parentIndex);

	if (*success == -1) {
		printString("No such program is found. ulululululululululululululululululululul\n\r");
		return;
	}

	for (i = 0; i < 512 * 16; i++) {
		putInMemory(segment, i, buffer[i]);
	}

	// Launch program (from kernel.asm)
	launchProgram(segment);
	// printString("AAAAAAAAAAAAAAAAAAAA")
}

void printBootLogo() {
	printString("	               ,@@@@@@@,\r\n"					);
	printString("       ,,,.   ,@@@@@@/@@,  .oo8888o.\r\n"			);
	printString("    ,&%%&%&&%,@@@@@/@@@@@@,8888\\88/8o\r\n"		);
	printString("   ,%&\\%&&%&&%,@@@\\@@@/@@@88\\88888/88'\r\n"		);
	printString("   %&&%&%&/%&&%@@\\@@/ /@@@88888\\88888'\r\n"		);
	printString("   %&&%/ %&%%&&@@\\ V /@@' `88\\8 `/88'\r\n"		);
	printString("   `&%\\ ` /%&'    |.|        \\ '|8'\r\n"			);
	printString("//\\ \\/ ._\\//_/__/  ,\\_//__\\/.  \\_//__/_\r\n"	);
	printString("     _               _                        \r\n");
	printString("    | |__  _   _ ___| |__   ___  ___          \r\n");
	printString("    | '_ \\| | | / __| '_ \\ / _ \\/ __|      \r\n");
	printString("    | |_) | |_| \\__ \\ | | |  __/\\__ \\     \r\n");
	printString("    |_.__/ \\__,_|___/_| |_|\\___||___/       \r\n");
}

int getPathIndex(char parentIndex, char *filePath) {
	char lineSize;
	char maxFileCount;
	char files[512 * 2];
	char idx;
	char P;
	char pathReadPos;
	char isFileFound;

	lineSize = 0x10;
	maxFileCount = 0x40;
	idx = 0;
	P = parentIndex;
	pathReadPos = 0;
	isFileFound = 0;

	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files + 512, 0x102, 0);

	// Check starting code
	// TODO: Optimize to not check current path
	if (filePath[0] == '/') {	// If Root folder
		pathReadPos ++;
		P = 0xFF;
	} else if (filePath[0] == '.' && filePath[1] == '/') {	// If current folder
		pathReadPos += 2;
	} else {			// If @ $PATH
		// P = $PATH
	}

	// Get index of filePath
	while (filePath[pathReadPos] != 0x00) {
		// Masuk kedalam folder
		if (filePath[pathReadPos] == '/') {		// Go inside folder
			if (isFileFound == 0) {
				return -1;
			}
			isFileFound = 0;
			pathReadPos++;
		// Up satu folder
		} else if (filePath[pathReadPos] == '.' && filePath[pathReadPos + 1] == '.' && filePath[pathReadPos + 2] == '/') {
			if (P == 0xFF) return -1;
			P = files[P * 16];
			pathReadPos += 3;
		// Cek nama folder/file dengan iterasi seluruh files
		} else {
			// File tidak di indeks parent
			if (P != files[idx * 16]) {
				idx++;
			} else if (files[idx * 16 + 2] == 0) {
				idx++;
			// File ketemu dan sesuai
			} else if (isStringStartsWith(filePath + pathReadPos, files + idx * 16 + 2, 14)) {
				pathReadPos += stringLength(files + idx * 16 + 2, 14);
				isFileFound = 1;
				P = idx;
				idx = 0;
			// File beda, lanjut terus
			} else {
				idx++;
			}
			// Udah mentok
			if (idx >= maxFileCount) {
				return -1;
			}
		}
	}

	if ((P != 0xFF) && (files[P * 16 + 1] != 0xFF)) {
		return P;
	} else {
		return (P | 0x100);
	}
}