void printShell(char *filecontain);
void printPath(char path);
int stringLength(char *string, int max);
char isStringStartsWith(char *a, char *b, int length);
int getPathIndex(char parentIndex, char *filePath);
<<<<<<< HEAD
void clear(char* buffer);
void printShellInteger(int n);
int div(int a, int b);
int mod(int a, int b);
=======
void clear(char *buffer, int length);
>>>>>>> e230910d6d53974f590c48762c68cf04dd6a4eee

int main()
{
	char command[512];
	char files[1024];
	char history[3][512];
	char parentIndex = 0xFF;
	char currentPath = 0xFF;
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
		// Clear command buffer
		// If previously is not arrow press, clear buffer
		if(!wasArrowPressed)
		{
			printPath(parentIndex);
			clear(command, 512);
		}
		else
		{
			printShell(command);
		}

		wasArrowPressed = 0;

		// Call readString() from kernel
		interrupt(0x21, 0x01, command, 0, 0);

		// Check for arrow key input
		if(command[0] == 0x00 && histCount!=0)
		{
			wasArrowPressed = 1;
			commandLength = 2;

			// // Get current command length
			// while(command[commandLength]!=0)
			// 	commandLength++;

			// printShellInteger(commandLength);
			// printShell("\n\r");
			// // commandLength--;

			// for(i = 0;i<commandLength;i++)
			// {
			// 	printShell("\b \b");
			// }
			// printShell(" ");

			// If up arrow detected...
			if(command[1] == 0x48)
			{
				if(histIdx<histCount-1)
				{
					++histIdx;
					clear(command, 512);

					for(i = 0;i < 512;i++)
						command[i] = history[histIdx][i];

					// printShell(command);
					// printShell(" taken from hist");
				}
			}

			// If down arrow detected...
			if(command[1] == 0x50)
			{
				if(histIdx>0)
				{
					--histIdx;
					clear(command, 512);

					for(i = 0;i < 512;i++)
						command[i] = history[histIdx][i];
				}
			}

			continue;
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
		else if (command[0] == '.' && command[1] == '/')
		{
			for (idx = 0; idx < 14; filesrow++)
			{
				if (((filesrow << 4) + 2) == 0x00)
				{
					flag = 0;
					break;
				}else if (((filesrow << 4) + 2 + idx) == 0x00)
				{
					break;
				}else if (((filesrow << 4) + 2 + idx) != command[idx+2])
				{
					flag = 0;
					break;
				}else
				{
					programName[idx] = command[idx+2];
				}
			}
			if(flag == 1)
			{
				interrupt(0x21, 0x06, *programName, 0x2000, &flag);
			}else
			{
				flag == 1;
			}
		}
<<<<<<< HEAD

		if(histCount<3)
		{
			printShell(command);
			printShell(" added to hist\n\r");

			for(i = 0;i<512;i++)
				history[histCount][i] = command[i];

			histCount++;
		}
=======
		clear(command, 512);
>>>>>>> e230910d6d53974f590c48762c68cf04dd6a4eee
	}
	return 0;
}

// Call printString() from kernel mode
void printShell(char *filecontain)
{
	interrupt(0x21, 0x00, filecontain, 0, 0);
}

void printPath(char path)
{
	char files[1024];
	char *string;
	char parentPath;
	int idx = 0;
	int i = 0;
	int filesrow;
	
	printShell("~/");
	if (path != 0xFF){
		// read sector
		interrupt(0x21, 0x02, files, 0x101, 0);
		parentPath = files[16 * path];
		for (filesrow = 0; filesrow < 64; filesrow++)
		{
			if(files[filesrow << 4] == parentPath)
				break;
		}
		while(((files[parentPath + 2 + i]) != 0x00) && ((parentPath) + 2 + i) < ((parentPath << 4) + 16)) {
			string[idx++] = files[(parentPath) + 2 + i];
			i++;
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

<<<<<<< HEAD
void clear(char* buffer, int size)
{
	int i;

	for(i=0;i<size;i++) buffer[i] = 0;
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
=======
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
>>>>>>> e230910d6d53974f590c48762c68cf04dd6a4eee
