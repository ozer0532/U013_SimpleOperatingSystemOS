// Read file from sector

/* Usage */
// buffer : the container of contents to be read
// path : the path relative to parentIndex of the file
// result : flag to determine operation success or not
// parentIndex : the sector index of the parent folder

void readFile(char *buffer, char *path, int *result, char parentIndex) {
	char sectors[512];
	char files[1024];
	int noSector;
	int secPos;
	int fileIdx;
	int secIdx;

	fileIdx = getPathIndex(parentIndex, path);

	if (fileIdx == -1) {
		printString("Cannot read file. No such file found.\n\r");
		*result = -1;
		return;
	}

	if ((fileIdx >> 8) == 0x1) {
		printString("Cannot read folder.\n\r");
		*result = -1;
		return;
	}

	printString("File found, reading file\r\n");

	readSector(files, 0x101);
	readSector(files + 512, 0x102);
	readSector(sectors, 0x103);

	// Baca sektor
	secIdx = files[fileIdx * 16 + 1];

	for (noSector = 0; noSector < 16; noSector++) {
		secPos = secIdx * 16 + noSector;
		if (sectors[secPos] == 0) {
			printString("End of file..\n\r");
			break;
		}
		printString("Reading sector\n\r");
		// clear(buffer + (noSector * 512), 512);
		readSector(buffer + (noSector * 512), sectors[secPos]);
	}
	
	*result = 1;
}