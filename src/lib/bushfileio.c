// Read file
void readFile(char *buffer, char *path, int *result, char parentIndex)
{
    interrupt(0x21, (parentIndex<<8) + 0x04, buffer, path, result);
}