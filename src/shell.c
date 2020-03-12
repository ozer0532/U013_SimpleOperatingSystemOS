/*int getPathIndex(char parentIndex, char *filePath);
void loop(void);

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

int main(){
	char parentIndex = 0xFF;
	char command[512]
	loop(parentIndex);
	int PathIndex = 0;

	readString(command);
	if(command[0] == 'c' && command[1] == 'd' && command[2] == ' ')
	{
		PathIndex = getPathIndex(parentIndex, command + 3);
		if(PathIndex == -1)
		{
			printString("No such file or directory");
		}
	}
}
*/

void printShell(char *filecontain)
{
	interrupt(0x21, 0x00, *filecontain, 0, 0);
}

void printPath(char path)
{
	char files[1024];
	char *string;
	int idx = 0;
	int i = 0;
	int filesrow;
	printShell("~/");
	if (path != 0xFF){
		interrupt(0x21, 0x02, files, 0x101, 0);
		for (filesrow = 0; filesrow < 64; filesrow++)
		{
			if((files[filesrow << 4]) == path)
			{
				break;
			}
		}
		while(((files[(filesrow << 4) + 2 + i]) != 0x00) && ((filesrow << 4) + 2 + i) < ((filesrow << 4) + 16)){
			string[idx++] = files[(filesrow << 4) + 2 + i];
			i++;
		}
		printShell(string);
	}
	printShell("$");
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
	P = 0xFF;
	pathReadPos = 0;
	isFileFound = 0;

	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files + 512, 0x102, 0);

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

int main()
{
	char command[512];
	char files[1024];
	char parentIndex = 0xFF;
	char currentPath = 0xFF;
	char *programName;
	int PathIndex = 0;
	int idx;
	int flag = 1;
	int filesrow;
	//readSector(files, 0x101);

	while(1)
	{
		printPath(currentPath);
		//printString(files + parentIndex * 16 + 2);
		//printString(" $ ");
		PathIndex = 0;
		interrupt(0x21, 0x01, command, 0, 0);
		if(command[0] == 'c' && command[1] == 'd' && command[2] == ' ')
		{
			if(command[3] == '.' && command[4] == '.' && command[5] == '/')
			{
				parentIndex = getPathIndex(parentIndex, parentIndex);
			}
			else
			{
				PathIndex = getPathIndex(parentIndex, command + 3);
				if(PathIndex != 0)
				{
					printShell("No such file or directory");
					printShell("\n\r");
				}
				else
				{
					parentIndex = PathIndex;
				}
			}
			
		}else if (command[0] == '.' && command[1] == '/')
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
	}
}