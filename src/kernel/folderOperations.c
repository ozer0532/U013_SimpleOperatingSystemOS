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

	// printString("Deleting folder ");
	// printString(buffer + 16*parentIndex + 2);
	// printString("\n\r");

	// Delete Content
	for(idxRow = 0; idxRow<64; idxRow++)
	{
		// If there is file/folder and is in current directory...
		if(buffer[(idxRow<<4)+2] != 0x00 && buffer[idxRow<<4] == parentIndex)
		{
			// If folder is being deleted...
            if(buffer[(idxRow<<4)+1] == 0xFF)
            {
				// Recursively delete the content
			    deleteContent(idxRow, buffer);
                for(idx = 0; idx<16; ++idx)
                {
                    buffer[(idxRow<<4) + idx] = 0x00;
                }
            }
			// else, delete file.
            else
            {
                // printString("Deleting ");
                // printString(buffer + idxRow*16 + 2);
                // printString("\n\r");
                deleteFileFromBuffer(buffer + idxRow*16+2, &flag, parentIndex, buffer);
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
		// If parentIndex equal...
		if(files[16*idxRow] == parentIndex)
		{
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
    
    deleteContent(idxRow, files);
    for(i = 0; i<16; i++)
    {
        files[(idxRow<<4)+i] = 0x00;
    }
	// Buffer to System(write sector)
	writeSector(files, 0x101);
    writeSector(files+512, 0x102);
}

void listContent(char parentIndex, char *filesList, int *fileCount)
{
	char files[1024];
	char sectors[512];
	int idxRow;
	int idxSector;
	int i = 0;

	// Read sector 0x101 & 0x102
	readSector(files, 0x101);
    readSector(files+512, 0x102);
	readSector(sectors, 0x103);

	// For each files in system
	for(idxRow = 0; idxRow<64; idxRow++)
	{
		// Check if P is equal to parentIndex
		if((files[idxRow<<4] == parentIndex) && (files[idxRow * 16 + 2] != 0))
		{
			filesList[i] = idxRow;
			i++;
		}
	}
	*fileCount = i;
	filesList[i] = 0xFF;
}
