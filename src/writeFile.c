void writeFile(char *buffer, char *path, int *sectorCount, char parentIndex) {
	char map[512];
	char files[1024];
	char sectors[512];

	int filesRow;
	int sectorsRow;
	int sectorToWrite;
	int i;
	int tmp;

	// Read map, files, sectors
	// 0x100, 0x101-0x102, 0x103
	readSector(map, 256);
	readSector(files, 0x101);
	readSector(files+512, 0x102);
	readSector(sectors, 0x103);
	
	// for(i=0;i<16;i++) {printHexa(files[16*parentIndex + i]);printString(" ");}

	// Check parent index validity
	if(parentIndex!=0xFF && files[(16*parentIndex)+1]!=0xFF)
	{
		printString("Failed to write file, folder invalid\n\r");
		*sectors = -4;
		return;
	}

	// Check for empty row in files
	for (filesRow = 0; filesRow < 64; filesRow++) {

		// If filename empty (no file/folder exists)...
		if (files[(filesRow << 4) + 2] == 0)
			break;

		// If filename equal to other files...
		if(/*files[(filesRow<<4) + 1] != 0xFF && */isStringEqual(path, files + (filesRow << 4) + 2, 14) == 1)
		{
			printString("Failed to write file, filename exists\n\r");
			*sectors = -1;
			return;

		} else {
			printString(path);
			printString(" ");
			printString(files + (filesRow<<4)+2);
		}
	}

	// If files sector is full...
	if (filesRow == 64) {
		printString("Failed to write file, files sector limit reached\n\r");
		*sectors = -2;
		return;
	}

	// If there are not enough sectors to be written...
	if (getEmptySectorCount(map, 256) < *sectorCount) {
		printString("Failed to write file, map sector limit reached\n\r");
		*sectors = -3;
		return;
	}

	// Check for empty row in sectors
	for(sectorsRow = 0; sectorsRow < 32; sectorsRow++)
	{
		// If sectors row empty...
		if((sectors[sectorsRow << 4]) == 0){
			break;
		}
	}

	// If sectors sector is full...
	if(sectorsRow == 32) {
		*sectors = -3;
		printString("Failed to write file, sectors sector limit reached\n\r");
		return;
	}

	// Clear files row
	clear(files + (filesRow << 4), 16);
	
	// Set `P` value in files row
	files[filesRow<<4] = parentIndex;

	// Set `S` value in files row
	files[(filesRow<<4) + 1] = sectorsRow;

	// Set filename in files row
	for (i = 0; i < 14; i++) {
		if (path[i] == 0)
			break;
		
		files[(filesRow<<4) + 2 + i] = path[i];
	}

	// Write all buffer contents
	for (i = 0; i < *sectorCount; i++) {
		// Find empty sector to write in
		sectorToWrite = getFirstEmptySector(map, 256);
		
		// Mark in map sector
		map[sectorToWrite] = 0xFF;

		// Store sector number in sectors sector
		sectors[(sectorsRow<<4) + i] = sectorToWrite;

		printString("Writing to sector ");
		printInteger(sectorToWrite);
		printString("\n\r");
		writeSector(buffer + (i<<9), sectorToWrite);
	}

	/// Write to system.img
	writeSector(map, 0x100);
	writeSector(files, 0x101);
	writeSector(files+512, 0x102);
	writeSector(sectors, 0x103);
}
