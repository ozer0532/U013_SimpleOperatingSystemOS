void createFolder(char *filename, char parentIndex)
{
	char files[1024];
	int idxRow;
	int idx;

	// Read sector 0x101 & 0x102
    readSector(files, 0x101);
    readSector(files+512, 0x102);
	
	// Check filename
	for(idxRow = 0; idxRow<64; ++idxRow)
	{
        // If parentIndex equal...
		if(files[16*idxRow] == parentIndex)
		{
            // printString(filename);
            // printString(files +16*idxRow+2);
			if(isStringEqual(filename, files + 16*idxRow+2, 14) == 1)		// Folder already exist
			{
				printString("Folder exists.\n\r");
				return;
			}
		}
	}

    printString("Creating folder...\n\r");
    
    // Search empty entry on files sector
    idxRow = 0;
    while(files[(idxRow<<4) + 2] != 0x00)
    {
        idxRow+=1;
    }
    
    if(idxRow>=64)
    {
        printString("Files sector limit reached\n\r");
        return;
    }
    
	// Make New Folder
    files[idxRow<<4] = parentIndex;
    files[(idxRow<<4) + 1] = 0xFF;
    idx = 0;
    while(filename[idx] != 0x00)
    {
        files[(idxRow<<4)+2+idx] = filename[idx++];
    }

	// Buffer to System(write sector)
    writeSector(files, 0x101);
    writeSector(files+512, 0x102);
}

void deleteContent(char parentIndex, char * buffer)
{
	int idxRow;
	int idx;
    int flag = 1;

    printInteger(parentIndex);

	// Delete Content
	for(idxRow = 0; idxRow<64; idxRow++)
	{
		if(buffer[idxRow<<4] == parentIndex)
		{
			// Recursive
            if(buffer[(idxRow<<4)+1] == 0xFF)
            {
			    deleteContent(idxRow, buffer);
                for(idx = 0; idx<16; ++idx)
                {
                    buffer[(idxRow<<4) + idx] = 0x00;
                }
            }
            else
            {
                printString("Deleting ");
                printString(buffer + idxRow*16 + 2);
                printString("\n\r");
                deleteFile(buffer + idxRow*16+2, &flag, parentIndex);
                if(flag == -1) return;
            }
                
		}
	}
}

void deleteFolder(char * filename, char parentIndex)
{
	char files[1024];
	int idxRow;
	int idx;
	int i;
    
	// Read sector 0x101 & 0x102
	readSector(files, 0x101);
    readSector(files+512, 0x102);

	// Check filename
	for(idxRow = 0; idxRow<64; ++idxRow)
	{
        printInteger(idxRow);
		// If parentIndex equal...
		if(files[16*idxRow] == parentIndex)
		{
            printString(filename);
            printString("\n\r");
            printString(files +16*idxRow+2);
            printString("\n\r");

            printInteger(isStringEqual(filename, files + 16*idxRow + 2, 14));
            printString("\n\r");
			if(isStringEqual(filename, files + 16*idxRow + 2, 14) == 1)		// Folder found
			{
                break;
			}
		}
	}

    if(idxRow>=64)
    {
        printString("Folder not found you dummy!\n\r");
        return;
    }
    
    printString("Deleting folder...\n\r");
    deleteContent((char)idxRow, files);
    for(i = 0; i<16; i++)
    {
        files[(idxRow<<4)+i] = 0x00;
    }
	// Buffer to System(write sector)
	writeSector(files, 0x101);
    writeSector(files+512, 0x102);
}

void listContent(char * filename, char parentIndex)
{
	char files[1024];
	char sectName[16];
	int idxRow;
	int idx;
	int i;
	int j;

	// Read sector 0x101 & 0x102
	readSector(files, 0x101);
    readSector(files+512, 0x102);

	// Check filename
	for(idxRow = 0; idxRow<64; idxRow++)
	{
		if(files[idxRow<<4] == parentIndex)
		{
			idx = 0;
			while(files[(idxRow<<4)+2+idx] != 0x00)
			{
				if(files[(idxRow<<4)+2+idx] != filename[idx])
				{
					break;
				}else
				{
					idx+=1;
				}
			}
			if(files[(idxRow<<4)+2+idx] == 0x00)		// Folder found
			{
				for(i = 0; i<64; i++)
				{
					if(files[i<<4] = idxRow<<4)
					{
						for (j = 0; j < 16; j++)		// Clear sectName
						{
							sectName[j] = 0x00;
						}
						for (j = 0; j < 16; j++)		// Copy file name
						{
							sectName[j] = files[(i<<4)+2+j];
						}
						// Print sectName
						interrupt(0x21, 0x00, sectName, 0, 0);
					}
				}
				break;
			}
		}
	}
}
