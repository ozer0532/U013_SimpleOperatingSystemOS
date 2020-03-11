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

void shell()
{
	char command[512];
	char parentIndex = 0xFF;
	int PathIndex = 0;
	char files[1024];
	readSector(files, 0x101);

	while(1)
	{
		printString("~/");
		printString(files + parentIndex * 16 + 2);
		printString(" $ ");
		PathIndex = 0;

		readString(command);
		if(command[0] == 'c' && command[1] == 'd' && command[2] == ' ')
		{
			if(command[3] == '.' && command[4] == '.' && command[5] == '\\')
			{
				parentIndex = getPathIndex(parentIndex, parentIndex);
			}
			else
			{
				PathIndex = getPathIndex(parentIndex, command + 3);
				if(PathIndex != 0)
				{
					printString("No such file or directory");
					printString("\n\r");
				}
				else
				{
					parentIndex = PathIndex;
				}
			}
			
		}
	}
}