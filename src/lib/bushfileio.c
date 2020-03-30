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