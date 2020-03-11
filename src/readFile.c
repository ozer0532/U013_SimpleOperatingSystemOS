void readFile(char *buffer, char *path, int *result, char parentIndex) {
	char sectors[512];
	int noSector;
	int secPos;
	int fileIdx;
	
	fileIdx = getPathIndex(parentIndex, path);

	if (fileIdx == -1) {
		*result = -1;
		return;
	}

	// Baca sektor dir
	// readSector(dir, 2);

	// Nama file sesuai?
	// for (entry = 0; entry < 16; entry++) {
	// 	if (isStringEqual(dir + entry * 32, filename, 12) == 1) {
	// 		break;
	// 	}
	// }

	// success <- FALSE
	// if (entry == 16) {
	// 	printString("Failed to read file, no file found\n\r");
	// 	*result = -1;
	// 	return;
	// }

	printString("File found, reading file\n\r");
	// Baca sektor
	for (noSector = 0; noSector < 20; noSector++) {
		secPos = fileIdx * 16 + noSector;
		if (sectors[secPos] == 0) {
			printString("End of file..\n\r");
			break;
		}
		printString("Reading sector...\n\r");
		readSector(buffer + noSector * 512, sectors[secPos]);
	}
	
	*result = 1;
}