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
	char files[1024];
	int idxRow = 0;

	// Read sector 0x101 & 0x102
	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files+512, 0x102, 0);

	while (idxRow < 64) {
		if (files[idxRow * 16] == currentDirectory && folStrEq(fileName, files + idxRow * 16 + 2, 14)) {
			if (files[idxRow * 16 + 1] == 0xFF) {
				return 1;
			} else {
				return 0;
			}
		} else {
			idxRow++;
		}
	}
	return -1;	// Not Found
}

int folStrEq(char *a, char *b, int length) {
	int i;

	for (i = 0; i < length; ++i) {
		if (*(a+i) != *(b+i)) {
			return 0;
		}
		if (a[i] == 0) {
			//printString("\rw");
			return 1;
		}
	}
	return 1;
}