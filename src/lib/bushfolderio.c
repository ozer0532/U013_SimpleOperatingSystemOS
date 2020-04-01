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
void listContent(char parentIndex)
{
	interrupt(0x21, (parentIndex<<8) + 0x0A, 0, 0, 0);
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