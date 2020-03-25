void printShell(char *filecontain);
void printPath(char path);
int stringLength(char *string, int max);
char isStringStartsWith(char *a, char *b, int length);
int getPathIndex(char parentIndex, char *filePath);
void printShellInteger(int n);
int div(int a, int b);
int mod(int a, int b);

void clear(char *buffer, int length);

int main()
{
	char command[512];
	char tmp[10];
	char files[1024];
	char history[3][512];
	char parentIndex = 0xFF;
	char *programName;
	char wasArrowPressed = 0;

	int histCount = 0;
	int histIdx = -1;
	int pathIndex = 0;
	int idx;
	int flag = 1;
	int filesrow;
	int i;
	int commandLength;
	// readSector(files, 0x101);

	while(1)
	{
		printPath(parentIndex);
		printShell(command);

		wasArrowPressed = 0;

		// Call readString() from kernel
		interrupt(0x21, 0x01, command, 0, 0);

		histIdx = histCount;
		// Check for arrow key input
		if(command[0] == 0x00 && histCount!=0)
		{
			// wasArrowPressed = 1;
			// commandLength = 2;

			// printShell(command+2);
			// Get current command length
			while(command[commandLength]!=0)
				commandLength++;

			// printShellInteger(commandLength);
			// printShell("\n\r");
			// // commandLength--;

			if(command[2] != 0) for(i = 0;i<commandLength;i++)
			{
				printShell("\b \b");
			}
			// printShell(" ");

			// If up arrow detected...
			histIdx = histCount - 1;
			while (1) {
				if (command[2] != 0) {
					interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
					interrupt(0x10, 0xe00 + ' ', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
					interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
					for (i = 1; command[i] != 0; i++) {
						interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
						interrupt(0x10, 0xe00 + ' ', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
						interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
					}
				}
				clear(command, 512);
				for (i = 0; i < 512; i++) {
					command[i] = history[histIdx][i];
				}
				printShell(command);
				// printShell(" taken from hist\n\r");
				interrupt(0x21, 0x01, tmp, 0, 0);
				if (tmp[0] == 0) break;
				if (tmp[1] != 0x48 && tmp[1] != 0x50) {
					break;
				}
				if (tmp[1] == 0x48) {
					histIdx--;
					if (histIdx < 0) {
						histIdx = 0;
					}
				} else {
					histIdx++;
					if (histIdx == histCount) {
						histIdx = histCount - 1;
					}
				}
			}

			// break;
		}

		pathIndex = 0;

		// If command is `cd`...
		if(command[0] == 'c' && command[1] == 'd' && command[2] == ' ')
		{
			// If going down one directory...
			if(command[3] == '.' && command[4] == '.' && command[5] == '/')
			{
				parentIndex = getPathIndex(parentIndex, "../");
			}
			else
			{
				pathIndex = getPathIndex(parentIndex, command + 3);
				if(pathIndex == -1)
				{
					printShell("No such file or directory");
					printShell("\n\r");
				}
				else
				{
					parentIndex = pathIndex;
					
				}
			}
			
		}
		if (command[0] == '.' && command[1] == '/')
		{
			interrupt(0x21, 0xFF06, command + 2, 0x2000, &flag);
			if (flag == -1)
			{
				printShell("file not found\n\r");
			}
		}

		if(histCount<3)
		{
			// printShell(command);

			for(i = 0;i<512;i++)
				history[histCount][i] = command[i];

			histCount++;
		}

		clear(command, 512);
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
	char *string;
	int filesrow;
	int idx;
	int i = 0;
	
	printShell("~/");
	filesrow = parentIdx;
	if (filesrow != 0xFF){
		// read sector
		interrupt(0x21, 0x02, files, 0x101, 0);
		while (files[filesrow << 4] != 0xFF)
		{
			idx = 0;
			while (files[(filesrow << 4) + 2 + idx] != 0x00)
			{
				string[i] = files[(filesrow << 4) + 2 + idx];
				idx++;
				i++;
			}
			string[i] = '/';
			i++;
			filesrow = files[filesrow << 4];
		}
		if (files[filesrow << 4] == 0xFF)
		{
			idx = 0;
			while (files[(filesrow << 4) + 2 + idx] != 0x00)
			{
				string[i] = files[(filesrow << 4) + 2 + idx];
				idx++;
				i++;
			}
		}
		printShell(string);
	}

	printShell("$ ");
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
			// File ketemu dan sesuai
			} else if (isStringStartsWith(filePath + pathReadPos, files + idx * 16 + 2, 14)) {
				pathReadPos += stringLength(idx, 14);
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

	return P;
}

void printShellInteger(int n) {
	int tmp = n;
    int i;
    int length = 0;
	char isNegative = 0;
	char number[11];

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
    while(tmp!=0)
    {
        tmp = div(tmp, 10);
        ++length;
    }

    tmp = n;

	for(i=length-1;i>=0;i--)
	{
		number[i] = mod(tmp,10) + '0';
		// printShell(number+i);
		tmp = div(tmp, 10);
	}

    number[length] = 0;

    if(isNegative)
    	printShell("-");

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
