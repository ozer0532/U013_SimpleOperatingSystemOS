// INTERRUPT HANDLING
void handleInterrupt21 (int AX, int BX, int CX, int DX);
void printString(char *string);
void readString(char *string);
void readSector(char *buffer, int sector);
void writeSector(char *buffer, int sector);
void readFile(char *buffer, char *filename, int *success);
void clear(char *buffer, int length); //Fungsi untuk mengisi buffer dengan 0
void writeFile(char *buffer, char *filename, int *sectors);
void executeProgram(char *filename, int segment, int *success);
void returnToKernel(char *string);

int div(int a, int b);
int mod(int a, int b);

int getEmptySectorCount(char *buffer, int sectors);
int getFirstEmptySector(char *buffer, int sectors);

char isStringEqual(char *a, char *b, int length);

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

    while (1) {
		printString("bushes:~ ");
		readString(command);
		if(isStringEqual(command, "moo", 3))
		{
			executeProgram("moo", 0x2000, &flag);
		}
		else if(isStringEqual(command, "hello", 5))
		{
			executeProgram("hello", 0x2000, &flag);
		}
		else if(isStringEqual(command, "uwu", 3))
		{
			readFile(fileRead, "key.txt", &flag);
			printString(fileRead);
			printString("\r\n");
		}
		else if(isStringEqual(command, "milestone1", 10))
		{
			executeProgram("milestone1", 0x2000, &flag);
		}
		// clear(fileRead, 512 * 20);
		// printString("Write a command [cat|run|ls]: ");
		// readString(input);
		// if (isStringEqual(input, "cat", 100)) {
		// 	printString("Pick a file to load: ")
		// }
	}
}

void handleInterrupt21 (int AX, int BX, int CX, int DX) {
    switch (AX) {
	case 0x0:
		printString(BX);
		break;
	case 0x1:
		readString(BX);
		break;
	case 0x2:
		readSector(BX, CX);
		break;
	case 0x3:
		writeSector(BX, CX);
		break;
	case 0x4:
		readFile(BX, CX, DX);
		break;
	case 0x5:
		writeFile(BX, CX, DX);
		break;
	case 0x6:
		executeProgram(BX, CX, DX);
		break;
	case 0x7:
		returnToKernel(BX);
		break;
	default:
		printString("Invalid interrupt");
	}
}

void printString(char *string) {
	char * pointer = string;

	// While not NULL...
	while (*pointer != 0x00) {
		interrupt(0x10, 0x0e00 + *pointer, 0x000F, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
		pointer++;
	}
}

void readString(char *string) {
	// Interrupt for reading keystroke (16)
	int charInput = interrupt(0x16, 0, 0, 0, 0);

	// Initialize buffer position
	int pos = 0;

	while (charInput != '\r') {
		// If character is not backspace...
		if (charInput != '\b')
		{
			string[pos++] = charInput;
			interrupt(0x10, 0xe00 + charInput, 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
		}
		// If character is backspace and position is not 0 (not at starting point)
		else if(pos>0)
		{
			// Clear previous character
			interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			interrupt(0x10, 0xe00 + ' ', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			
			// Replace deleted character with NULL (0)
			string[--pos] = 0;
		}
		charInput = interrupt(0x16, 0, 0, 0, 0);		// int 16=Keyboard; Ah 00=Get Keystroke Ret AH= char input
	} 
	// CRLF
	interrupt(0x10, 0xe00 + '\n', 0xF, 0, 0);		// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
	interrupt(0x10, 0xe00 + '\r', 0xF, 0, 0);		// int 10=Video; AH 0e=TTY Output; BL 0F=White Front

	string[pos] = 0;
}

void readSector(char *buffer, int sector) {
	// int 13=Disk; AH 02=Read Sector; AL 01=Read 1 sector; BX Output Buffer; CH Cylinder #; CL Sector #; DH Head #; DL Drive #
	interrupt(0x13, 0x201, buffer, div(sector, 36) * 0x100 + mod(sector, 18) + 1, mod(div(sector, 18), 2) * 0x100);
}

void writeSector(char *buffer, int sector) {
	// int 13=Disk; AH 03=Write Sector; AL 01=Read 1 sector; BX Input Buffer; CH Cylinder #; CL Sector #; DH Head #; DL Drive #
	interrupt(0x13, 0x301, buffer, div(sector, 36) * 0x100 + mod(sector, 18) + 1, mod(div(sector, 18), 2) * 0x100);
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
	while (a > b) {
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

void writeFile(char *buffer, char *filename, int *sectors) {
	char map[512];
	char dir[512];
	int fileId;
	int filenamePos;
	int sectorToWrite;
	int i;

	// **Baca sektor map dan dir
	// Sectors : 0 = bootloader, 1 = map, 2 = dir
	readSector(map, 1);
	readSector(dir, 2);

	// Cek dir yang kosong
	for (fileId = 0; fileId < 16; fileId++) {
		// Get filename position
		filenamePos = fileId * 32;

		// Check if file empty (name string = 0)
		if (dir[filenamePos] == 0) {
			break;
		}
	}

	// Hentikan proses penulisan file
	if (fileId == 16) {
		printString("Failed to write file, file limit reached");
		return;
	}

	// Cek jumlah sektor di map cukup untuk buffer file
	if (getEmptySectorCount(map, 256) < *sectors) {
		// Hentikan proses penulisan file
		printString("Failed to write file, sector limit reached");
		return;
	}

	// Bersihkan sektor yang akan digunakan menyimpan nama
	clear(dir + fileId * 32, 12);

	// Isi sektor pada dir dengan nama file
	for (i = 0; i < 12; i++) {
		if (filename[i] == 0) {
			break;
		}
		dir[fileId * 32 + i] = filename[i];
	}

	// Tulis semua buffer
	for (i = 0; i < *sectors; i++) {
		// Cari sektor di map yang kosong
		sectorToWrite = getFirstEmptySector(map, 256);
		
		// Isi sektor tersebut dengan byte di buffer
		writeSector(buffer + 512 * i, sectorToWrite);

		// Tandai di map
		map[sectorToWrite] = 0xFF;

		// Tandai di dir
		dir[fileId * 32 + 12 + i] = sectorToWrite;
	}

	// Simpan map dan dir ke disk
	writeSector(map, 1);
	writeSector(dir, 2);
}

int getEmptySectorCount(char *buffer, int sectors) {
	int count;
	int i;

	count = 0;
	for (i = 0; i < sectors; i++) {
		if (buffer[i] == 0x00) {
			count++;
		}
	}
	return count;
}

int getFirstEmptySector(char *buffer, int sectors) {
	int i;
	for (i = 0; i < sectors; i++) {
		if (buffer[i] == 0x00) {
			return i;
		}
	}
}

void readFile(char *buffer, char *filename, int *success) {
	char dir[512];
	int entry;
	int noSector;
	int dirPos;
	
	// Baca sektor dir
	readSector(dir, 2);

	// Nama file sesuai?
	for (entry = 0; entry < 16; entry++) {
		if (isStringEqual(dir + entry * 32, filename, 12) == 1) {
			break;
		}
	}

	// success <- FALSE
	if (entry == 16) {
		printString("Failed to read file, no file found\n\r");
		*success = 0;
		return;
	}

	printString("File found, reading file\n\r");
	// Baca sektor
	for (noSector = 0; noSector < 20; noSector++) {
		dirPos = entry * 32 + 12 + noSector;
		if (dir[dirPos] == 0) {
			printString("End of file..\n\r");
			break;
		}
		printString("Reading sector...\n\r");
		readSector(buffer + noSector * 512, dir[dirPos]);
	}
	
	*success = 1;
}

char isStringEqual(char *a, char *b, int length) {
	int i;

	for (i = 0; i < length; i++) {
		if (a[i] != b[i]) {
			return 0;
		}
		if (a[i] == 0) {
			return 1;
		}
	}

	return 1;
}

void executeProgram(char *filename, int segment, int *success) {
	char buffer[512 * 20];
	int i;

	clear(buffer, 512 * 20);

	readFile(buffer, filename, success);

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
	executeProgram(string, 0x3000, &one);
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