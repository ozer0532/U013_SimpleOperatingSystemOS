void bushCreateFolder(char * filename, char parentIndex);
void deleteContent(char parentIndex, char * Buffer);
void bushDeleteFolder(char * filename, char parentIndex);
void bushListContent(char * filename, char parentIndex);

void bushCreateFolder(char * filename, char parentIndex)
{
	char files[1024];
	int idxRow;
	int idx;

	// Read sector 0x101
	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files+512, 0x102, 0);

	// Check filename
	for(idxRow = 0; idxRow<64; idxRow++)
	{
		if(files[idxRow<<4] == parentIndex && files[(idxRow<<4)+1] == 0xFF)
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
			if(files[(idxRow<<4)+2+idx] == 0x00)		// Folder already exist
			{
				interrupt(0x21, 0x00, "folder already exist", 0, 0);
				break;
			}
		}
	}
	// Make New Folder
	if(files[idxRow<<4] == 0x00)
	{
		files[idxRow<<4] = parentIndex;
		files[(idxRow<<4) + 1] = 0xFF;
		idx = 0;
		while(files[(idxRow<<4)+2+idx] !- 0x00)
		{
			files[(idxRow<<4)+2+idx] = filename[idx];
			idx+=1;
		}
	}
	// Buffer to System(write sector)
	interrupt(0x21, 0x03, files, 0x101, 0);
	interrupt(0x21, 0x03, files+512, 0x102, 0);
}

void deleteContent(char parentIndex, char * Buffer)
{
	int idxRow;
	int idx;

	// Delete Content
	idxRow = 0;
	for(idxRow = 0; idxRow<64; idxRow++)
	{
		if(Buffer[idxRow<<4] == parentIndex)
		{
			// Recursive
			deleteContent(idxRow<<4, Buffer);
			for(idx = 0; idx<16; idx++)
			{
				Buffer[(idxRow<<4)+idx] = 0x00;
			}
		}
	}
}

void bushDeleteFolder(char * filename, char parentIndex)
{
	char files[1024];
	int idxRow;
	int idx;
	int i;

	// Read sector 0x101
	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files+512, 0x102, 0);

	// Check filename
	idxRow = 0;
	for(idxRow = 0; idxRow<64; idxRow++)
	{
		if(files[idxRow<<4] == parentIndex && files[(idxRow<<4)+1] == 0xFF)
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
				interrupt(0x21, 0x00, "folder deleted\n\r", 0, 0);
				deleteContent(idxRow<<4, files);
				for(i = 0; i<16; i++)
				{
					files[(idxRow<<4)+i] = 0x00;
				}
				break;
			}
		}
	}
	// Buffer to System(write sector)
	interrupt(0x21, 0x03, files, 0x101, 0);
	interrupt(0x21, 0x03, files+512, 0x102, 0);
}

void bushListContent(char * filename, char parentIndex)
{
	char files[1024];
	char sectName[16];
	int idxRow;
	int idx;
	int i;
	int j;

	// Read sector 0x101
	interrupt(0x21, 0x02, files, 0x101, 0);
	interrupt(0x21, 0x02, files+512, 0x102, 0);

	// Check filename
	for(idxRow = 0; idxRow<64; idxRow++)
	{
		if(files[idxRow<<4] == parentIndex && files[(idxRow<<4)+1] == 0xFF)
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
