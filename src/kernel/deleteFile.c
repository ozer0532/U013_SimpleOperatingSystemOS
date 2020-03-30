void deleteFile(char* path, int* result, char parentIndex)
{
    char mapBuffer[512];
    char filesBuffer[1024];
    char sectorsBuffer[512];
    char emptySector[512];
    int filesIdx, sectorsIdx;
    int i, j;
    int currentSector;

    clear(emptySector, 512);
    readSector(mapBuffer, 0x100);
    readSector(filesBuffer, 0x101);
    readSector(filesBuffer+512, 0x102);
    readSector(sectorsBuffer, 0x103);

    filesIdx = getPathIndex(parentIndex, path);

    if(filesIdx == -1)
    {
        printString("No such file found.\r\n");
        *result = -1;
        return;
    }

    if ((filesIdx >> 8) == 0x1)
    {
		printString("Cannot read folder.\n\r");
		*result = -1;
		return;
	}

    printString("File found, deleting file...\n\r");

    // Check for each entry
    sectorsIdx = filesBuffer[16 * filesIdx + 1];
    for(i = 0; i <16; ++i)
    {
        currentSector = sectorsBuffer[16*sectorsIdx + i];

        if(currentSector != 0)
        {
            // Empty sectors
            writeSector(emptySector, currentSector);
            
            //  Unmark sectors
            mapBuffer[currentSector] = 0x00;
            sectorsBuffer[16*sectorsIdx + i] = 0x00;
        }
    }

    // Delete entry in files sectors
    for(i = 0; i < 16; ++i)
    {
        filesBuffer[16 * filesIdx + i] = 0x00;
    }

    // Write to sectors
    writeSector(mapBuffer, 0x100);
    writeSector(filesBuffer, 0x101);
    writeSector(filesBuffer+512, 0x102);
    writeSector(sectorsBuffer, 0x103);

}