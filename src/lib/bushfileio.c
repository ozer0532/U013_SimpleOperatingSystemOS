// Read file
void readFile(char *buffer, char *path, int *result, char parentIndex)
{
    interrupt(0x21, (parentIndex<<8) + 0x04, buffer, path, result);
}

// Write file
void writeFile(char *buffer, char *path, int *result, char parentIndex)
{
    interrupt(0x21, (parentIndex<<8) + 0x05, buffer, path, result);
}

// Delete file
void deleteFile(char *path, int *result, char parentIndex)
{
    interrupt(0x21, (parentIndex<<8) + 0x07, 0, path, result);
}

void getFileName(int index, char* filename) {
	char files[1024];
	int i;

	// Read sector 0x101 & 0x102
	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files+512, 0x102, 0);

	for (i = 0; i < 14; i++) {
		filename[i] = files[index * 16 + 2 + i];
	}
}