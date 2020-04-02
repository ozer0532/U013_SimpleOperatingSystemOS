void printShell(char *filecontain);
void printPath(char path);
int stringLength(char *string, int max);
char isStringStartsWith(char *a, char *b, int length);
int getPathIndex(char parentIndex, char *filePath, char *isFolder);
void printShellInteger(int n);
int div(int a, int b);
int mod(int a, int b);
void strcpy(char * dest, char * src);
void listFolderContents(char folderIndex, char *returnList);
void parseCommand(char *fullCommand, char *mainCommand, int *paramsStart);
void pushParameters(char *parameters, char currentDirectory);

void clear(char *buffer, int length);

int main()
{
	char command[128];
	char tmp[10];
	char history[4][128];		// Max 4 commands (above that OOB?)
	char fileBuffer[512];
	char parameterBuffer[512];
	char parentIndex = 0xFF;
	char wasArrowPressed = 0;
	char pathEnvIndex = 0xFF;		// $PATH position
	char isFolder;
	char parsedCommand[15];

	int histCount = 0;
	int histIdx = -1;		// current index on the history
	int pathIndex = 0;
	int idx;
	int flag = 1;
	int filesrow;
	int i;
	int j;
	int k;
	int commandLength;
	// readSector(files, 0x101);

	// INISIALISASI (CLEARING STUFF)
	clear(history, 4 * 128);

	while(1)
	{
		// Clear command buffer
		// If previously is not arrow press, clear buffer
		// if(!wasArrowPressed)
		// {
		// 	printPath(parentIndex);
		// 	clear(command, 512);
		// }
		// else
		// {
		// 	printShell(command);
		// }

		if (!wasArrowPressed) {
			printPath(parentIndex);
		}
		// printShell(command);

		// wasArrowPressed = 0; NOT USED ATM

		// Call readString() from kernel
		interrupt(0x21, 0x01, command, 0, 0);


		// ARROW KEYS ARE PRESSED
		if(command[0] == 0x00 && command[1] != 0x00)
		{
			// Command = up arrow
			if (command[1] == 0x48) {
				if (histIdx < histCount - 1) {
					histIdx++;
				}
			// Command = down arrow
			} else if (command[1] == 0x50) {
				if (histIdx > -1) {
					histIdx--;
				}
			}

			if (histIdx != -1) {
				// Type the saved command onto the screen
				printShell(history + histIdx * 128);

				// Copy the saved command into command variable
				strcpy(command + 3, history + histIdx * 128);

				// Insert payload
				command[0] = 0xb0; command[1] = 0xb0; command[2] = stringLength(command + 3, 126);
			} else {
				clear(command, 128);
			}
			// Else clear text (do nothing, covered by readString in kernel)

			wasArrowPressed = 1;



		// ARROW KEYS ARE NOT PRESSED
		} else {
			// -=-=-=-=-= BETA =-=-=-=-=- (ribet, harusnya masukin current path index dsb gt yg butuh)
			// STORE PARAMETER TO SECTOR 0x104 :D
			// readSector(parameterBuffer, 0x104);
			
			// // Find character after space
			// i = 0;
			// j = 0;
			// while(command[i] != ' ') i++;
			// ++i;

			// // Insert parameter to buffer
			// while(command[i] != 0x00)
			// {
			// 	parameterBuffer[j++] = command[i++];
			// }

			// writeSector(parameterBuffer, 0x104);

			// ------------------------------  COMMAND = cd
			if (isStringStartsWith(command, "cd ", 3)) {
				pathIndex = getPathIndex(parentIndex, command + 3, &isFolder);
				if(pathIndex == -1 || !isFolder)
				{
					printShell("No such directory\n\r");
				}
				else
				{
					parentIndex = pathIndex;
				}
			}
			// ------------------------------  COMMAND = cat
			else if (isStringStartsWith(command, "cat", 3)) {
   				interrupt(0x21, (parentIndex<<8) + 0x04, fileBuffer, command+4, &flag);
				// interrupt(0x21, 0xFF06, command, 0x3000, &flag);
				if (flag == -1)
				{
					printShell("No such file\n\r");
				}
				else
				{
					printShell(fileBuffer);
				}
			}
			// ------------------------------  COMMAND = export $PATH
			else if (isStringStartsWith(command, "export ", 7)) {
				if (isStringStartsWith(command + 7, "$PATH ", 6)) {
					pathIndex = getPathIndex(parentIndex, command + 13, &isFolder);
					if(pathIndex == -1 || !isFolder)
					{
						printShell("No such directory\n\r");
					}
					else
					{
						pathEnvIndex = pathIndex;
					}
				} else {
					printShell("Usage: export $PATH <folder path>\n\r");
				}
			
			// ------------------------------  COMMAND = exit
			} else if (isStringStartsWith(command, "exit", 4)) {
				returnToSender();
				return 0;
			}
			// ------------------------------  EXEC PROGRAM
			else if (command[0] == '.' && command[1] == '/') {
				parseCommand(command + 2, parsedCommand, &i);
				pushParameters(command + i + 2, parentIndex);
				interrupt(0x21, 0xFF06, command + 2, 0x3000, &flag);
				if (flag == -1)
				{
					printShell("No such file\n\r");
				} else {
					printShell("\r\n");
				}
			}
			// ------------------------------  PATH ENV FILES
			else {
				// Execute program in path
				parseCommand(command, parsedCommand, &i);
				pushParameters(command + i, parentIndex);
				interrupt(0x21, pathEnvIndex * 0x100 + 0x06, parsedCommand, 0x3000, &flag);
				if (flag == -1)
				{
			// ------------------------------  UNRECOGNIZED CMD
					printShell("Invalid command\n\r");
				} else {
					printShell("\r\n");
				}

			}


			// SAVING COMMAND TO HISTORY
			for (i = 4 - 2; i >= 0; i--) { 		// HISTORY SIZE - 2
				strcpy(history + (i + 1) * 128, history + i * 128);
			}
			if (histCount < 4) {
				histCount++;	
			}

			strcpy(history, command);

			wasArrowPressed = 0;
			histIdx = -1;

			// ORIGINAL ADD TO HISTORY CODE
			// if(histCount < 3) {
			// 	// printShell(command);

			// 	for(i = 0;i<512;i++)
			// 		history[histCount][i] = command[i];

			// 	histCount++;
			// }

			clear(command, 128);
		}

	}
	return 0;
}

// Call printString() from kernel mode
void printShell(char *filecontain)
{
	interrupt(0x21, 0x00, filecontain, 0, 0);
}

void printPath(char parentIdx)
{
	char files[1024];
	char string[16 * 32 + 1];
	char folderOrder[32];
	int filesrow;
	int idx;
	int i;
	int j = 0;
	
	printShell("~/");
	filesrow = parentIdx;
	if (filesrow != 0xFF){
		// read sector
		interrupt(0x21, 0x02, files, 0x101, 0);
		interrupt(0x21, 0x02, files + 512, 0x102, 0);

		// traceback to root
		idx = 0;
		while (filesrow != 0xFF)
		{
			folderOrder[idx] = filesrow;
			idx++;
			filesrow = files[filesrow * 16];
		}
		// string generation
		while (idx != 0)
		{
			idx--;
			i = 0;
			while (files[(folderOrder[idx] * 16) + 2 + i] != 0x00)
			{
				string[j] = files[(folderOrder[idx] * 16) + 2 + i];
				i++;
				j++;
			}
			if (idx != 0) {
				string[j] = '/';
				j++;
			}
		}
		string[j] = 0;
		printShell(string);
	}

	printShell("$ ");
}

void strcpy(char * dest, char * src) {
	int i = 0;
	while (src[i] != 0x00) {
		dest[i] = src[i];
		i++;
	}
	dest[i] = 0;
}

void charArrayCopy(char * dest, char * src, int size) {
	int i = 0;
	while (i < size) {
		dest[i] = src[i];
		i++;
	}
}

int stringLength(char *string, int max) {
	int length = 0;
	while (string[length] != 0 && length < max) {
		length++;
	}
	return length;
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

int getPathIndex(char parentIndex, char *filePath, char *isFolder) {
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
	*isFolder = ((P == 0xFF) || (files[P * 16 + 1] == 0xFF));

	return P;
}

void listFolderContents(char folderIndex, char *returnList) {
	char files[512 * 2];
	char i;
	char j = 0;

	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files + 512, 0x102, 0);

	for (i = 0; i < 64; i++) {
		if (files[i * 16] == folderIndex) {
			returnList[j] = i;
			j++;
		}
	}
	returnList[j] = 0xFF;
}

void printShellInteger(int n) {
	int tmp = n;
    int i;
    int length = 1;
	char number[5];
	char isNegative = 0;

    // If n is 0...
	if(n == 0) {
        printShell("0");
        return;
    }
    
    // If is negative...
    if(tmp<0)
    {
    	isNegative = 1;
    	tmp = -tmp;
    }

    // Check length of int
    while(tmp>10)
    {
        tmp = div(tmp, 10);
        ++length;
    }

    tmp = n;
	if (isNegative) {
		tmp = -tmp;
	}

	for(i=length-1;i>=0;i--)
	{
		number[i] = mod(tmp,10) + '0';
		tmp = div(tmp, 10);
	}
    number[length] = 0;

    if(isNegative) printShell("-");
    printShell(number);
}

int div(int a, int b) {
	int x = 0;
	while (a >= b) {
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

void clear(char *buffer, int length)
{
	int i;
	for (i = 0; i < length; i++) {
		buffer[i] = 0;
	}
}

void parseCommand(char *fullCommand, char *mainCommand, int *paramsStart) {
	int i = 0;

	while (fullCommand[i] != ' ' && fullCommand[i] != 0) {
		mainCommand[i] = fullCommand[i];
		i++;
	}
	*paramsStart = i + 1;
}

void pushParameters(char *parameters, char currentDirectory) {
	char buffer[512];
	char i = 2;
	char j = 16;
	char k = 0;

	clear(buffer, 512);
	buffer[0] = currentDirectory;
	if (parameters[k] != 0) {
		buffer[1] = 16;
	}
	while(parameters[k] != 0) {
		if (parameters[k] == ' ') {
			buffer[i] = j+1;
			buffer[j] = 0;
			i++;
		} else {
			buffer[j] = parameters[k];
		}
		j++;
		k++;
	}
	interrupt(0x21, 0x3, buffer, 0x403, 0);
}

//int getCurrentPathIdx(char parentPath, char *buffer, char *command)
//{
//	int filesrow;
//	int idx;
//	for (filesrow = 0; filesrow < 64; filesrow++)
//	{
//		if ((buffer[filesrow << 4] == parentPath) && (buffer[(filesrow << 4) + 1] == 0xFF))
//		{
//			idx = 0;
//			while (buffer[(filesrow << 4) + 2 + idx] != 0x00)
//			{
//				if (buffer[(filesrow << 4) + 2 + idx] != command[3 + idx])
//				{
//					break;
//				}
//				idx++;
//			}
//		}
//		if (buffer[(filesrow << 4) + 2 + idx] == 0x00)
//		{
//			return (filesrow << 4);
//		}
//	}
//	if (filesrow == 64)
//	{
//		return (-1);
//	}
//}

// c a d b e b a b c d 4frame
// GAMBAR + JUMLAH
// FIFO - cx ax dx bx ex bv av bv cx dv - 6
// LRU - cx ax dx bx ex bv av bv cx dx - 7
// LFU - cx ax dx bx ex bv av bv cx dv - 6
// MFU - cx ax dx bx ex bv av bv cx dv - 6
// Optimal - cx ax dx bx ex av bv av cx dv - 6