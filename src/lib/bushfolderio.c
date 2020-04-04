char folderContent[65];

// Create folder
void createFolder(char* filename, char parentIndex)
{
	interrupt(0x21, (parentIndex<<8) + 0x08, filename, 0, 0);
}

// Delete folder
void deleteFolder(char* filename, char parentIndex)
{
	interrupt(0x21, (parentIndex<<8) + 0x09, filename, 0, 0);
}

// List content
void listContent(char parentIndex, int *fileCount)
{
	char files[1024];

	// Read sector 0x101 & 0x102
	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files+512, 0x102, 0);
	
	interrupt(0x21, (parentIndex<<8) + 0x0A, folderContent, fileCount, 0);
}

void gfn(int index, char* filename) {
	char files[1024];
	int i;

	// Read sector 0x101 & 0x102
	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files+512, 0x102, 0);

	for (i = 0; i < 14; i++) {
		filename[i] = files[index * 16 + 2 + i];
	}
}

void getContentInFolder(int index, char* filename, char* isFolder) {
	gfn(folderContent[index], filename);
	*isFolder = (char)isEntryFolder(folderContent[index]);
}

// Check if entry is folder or not
int isEntryFolder(int idxRow)
{
	char files[1024];

	if (idxRow == 0xFF) {
		return 1;
	}

	if (idxRow >= 64 || idxRow < 0) {
		return -1;
	}

	// Read sector 0x101 & 0x102
	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files+512, 0x102, 0);

	if(files[(idxRow<<4)+1] == 0xFF)
		return 1;
	else
		return 0;
}

int isPathFolder(char* fileName, char currentDirectory)
{
	return isEntryFolder(getPathIndex(currentDirectory, fileName));
}

char folStrSW(char *a, char *b, int length) {
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

int folStrL(char *string, int max) {
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
			} else if (folStrSW(filePath + pathReadPos, files + idx * 16 + 2, 14)) {
				pathReadPos += folStrL(files + idx * 16 + 2, 14);
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