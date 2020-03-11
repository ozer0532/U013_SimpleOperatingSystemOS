// INTERRUPT HANDLING
void handleInterrupt21 (int AX, int BX, int CX, int DX);
void printString(char *string);
void printInteger(int n);
void printHexa(int n);
void readString(char *string);
void readSector(char *buffer, int sector);
void writeSector(char *buffer, int sector);
void readFile(char *buffer, char *path, int *result, char parentIndex);
void clear(char *buffer, int length); //Fungsi untuk mengisi buffer dengan 0
void writeFile(char *buffer, char *path, int *sectorCount, char parentIndex);
void executeProgram(char *filename, int segment, int *success, char parentIndex);
void returnToKernel(char *string);
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

// SHELL
void shell();

// MAIN FUNCTIONS
void printBootLogo();


int main () {
	char command[512];
	char filename[512];
	char fileRead[512 * 20];
	int flag = 1;
	int i;

    makeInterrupt21();

	printBootLogo();

	printString("\n");

<<<<<<< HEAD
    while (1) {
		// printString("bushes:~ ");
		// readString(command);
		// if(isStringEqual(command, "moo", 3))
		// {
		// 	executeProgram("moo", 0x2000, &flag);
		// }
		// else if(isStringEqual(command, "hello", 5))
		// {
		// 	executeProgram("hello", 0x2000, &flag);
		// }
		// else if(isStringEqual(command, "uwu", 3))
		// {
		// 	readFile(fileRead, "key.txt", &flag);
		// 	printString(fileRead);
		// 	printString("\r\n");
		// }
		// else if(isStringEqual(command, "milestone1", 10))
		// {
		// 	executeProgram("milestone1", 0x2000, &flag);
		// }
		// clear(fileRead, 512 * 20);
		// printString("Write a command [cat|run|ls]: ");
		// readString(input);
		// if (isStringEqual(input, "cat", 100)) {
		// 	printString("Pick a file to load: ")
		// }
		readString(command);
		printString(command);
		writeFile(command, "ambon\0", &flag, 0xFF);
		// writeFile(command, "cavendish", &flag, 0x00);
	}
=======
    shell();
>>>>>>> f46371294fa1f3325463ac9f306fd7d02ea936ed
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

int div(int a, int b) {
	int x = 0;
	while (a > b) {
		a -= b;
		x++;
	}
	return x;
}

int mod(int a, int b) {
	while (a >= b) {
		a -= b;
	}
	return a;
}

void clear(char *buffer, int length) {
	int i;
	for (i = 0; i < length; i++) {
		buffer[i] = 0;
	}
}

char isStringEqual(char *a, char *b, int length) {
	int i;

	for (i = 0; i < length; i++) {
		if (a[i] != b[i]) {
			// printString(a);
			// printString(b);
			// printString("\r\n");
			return 0;
		}
		if (a[i] == 0) {
			printString("\r");
			return 1;
		}
	}
	return 1;
}

char isStringStartsWith(char *a, char *b, int length) {
	int i;

	for (i = 0; i < length; i++) {
		if (b[i] == 0) {
			return 1;
		}
		if (a[i] != b[i]) {
			return 0;
		}
	}

	return 1;
}

int stringLength(char *string, int max) {
	int length = 0;
	while (string[length] != 0 && length < max) {
		length++;
	}
	return length;
}

void executeProgram(char *filename, int segment, int *success, char parentIndex) {
	char buffer[512 * 20];
	int i;

	clear(buffer, 512 * 20);

	readFile(buffer, filename, success, 0xFF);

	if (*success == 0) {
		printString("Siao a kenot launch edi a...");
		return;
	}

	for (i = 0; i < 512 * 20; i++) {
		putInMemory(segment, i, buffer[i]);
	}

	launchProgram(segment);
	// printString("Tescok");
}

void returnToKernel(char *string) {
	int one = 1;
	executeProgram(string, 0x3000, &one, 0xFF);
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

int getCurrentFolderIndex(char *currentPath) {
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
	P = 0xFF;
	pathReadPos = 0;
	isFileFound = 1;

	readSector(files, 0x101);
	readSector(files + 512, 0x102);
	
	// Get index of current path
	while (currentPath[pathReadPos] != 0x00) {
		if (currentPath[pathReadPos] == '/') {
			if (isFileFound == 0) {
				return -1;
			}
			isFileFound = 0;
			pathReadPos++;
		} else {
			if (isStringStartsWith(currentPath + pathReadPos, files + idx * 16 + 2, 14)) {
				pathReadPos += stringLength(idx, 14);
				isFileFound = 1;
				P = idx;
				idx = 0;
			} else {
				idx++;
			}
			if (idx >= maxFileCount) {
				return -1;
			}
		}
	}
	return P;
}

char getPathIndex(char parentIndex, char *filePath) {
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
	P = 0xFF;
	pathReadPos = 0;
	isFileFound = 0;

	readSector(files, 0x101);
	readSector(files + 512, 0x102);

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
		if (filePath[pathReadPos] == '/') {		// Go inside folder
			if (isFileFound == 0) {
				return -1;
			}
			isFileFound = 0;
			pathReadPos++;
		} else if (filePath[pathReadPos] == '.') {
			pathReadPos++;
			// parent folder
			if (filePath[pathReadPos] == '.' && filePath[pathReadPos + 1] == '.' && filePath[pathReadPos + 2] == '/') {
				if (P == 0xFF) return -1;
				P = files[P * 16];
				pathReadPos += 3;
			} else {
				// Read normally
			}
		} else {
			if (isStringStartsWith(filePath + pathReadPos, files + idx * 16 + 2, 14)) {
				pathReadPos += stringLength(idx, 14);
				isFileFound = 1;
				P = idx;
				idx = 0;
			} else {
				idx++;
			}
			if (idx >= maxFileCount) {
				return -1;
			}
		}
	}

	return P;
}