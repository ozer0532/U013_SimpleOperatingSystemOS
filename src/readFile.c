void readFile(char *buffer, char *path, int *result, char parentIndex) {
	char sectors[512];
	char files[1024];
	int noSector;
	int secPos;
	int fileIdx;
	int secIdx;
	printString("KUCING");
	fileIdx = getPathIndex(parentIndex, path);

	if (fileIdx == -1) {
		printString("Cannot read file. No such file found.");
		*result = -1;
		return;
	}

	readSector(files, 0x101);
	readSector(files + 512, 0x102);
	readSector(sectors, 0x103);

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

	printString("\r\n");
	printString("File found, reading file\r\n");

	if (fileIdx == -1) printString("Hello");

	// Baca sektor
	secIdx = files[fileIdx * 16 + 1];
	for (noSector = 0; noSector < 20; noSector++) {
		secPos = secIdx * 16 + noSector;
		if (sectors[secPos] == 0) {
			printString("End of file..\n\r");
			break;
		}
		printString("Reading sector");
		// printHexa(secPos);
		printString("\r\n");
		clear(buffer + (noSector * 512), 512);
		readSector(buffer + (noSector * 512), sectors[secPos]);
	}
	
	*result = 1;
}