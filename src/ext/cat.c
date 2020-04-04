int main()
{
	int isFile;
	char currentDir;
    char argc;
    char *argv[16];
    char *buffer[512*16];
    int fileExist;

    getParameters(&currentDir, &argc, argv);
	if (argc != 1) {
	    printString("Usage: cat <filename>");
	    returnToSender();
	    return 0;
    }

    isFile = isPathFolder(argv[0], currentDir);
    if(isFile == 0){
    	readFile(buffer, argv[0], fileExist, currentDir);
    	printString(buffer);
    	printString("\n");
    }
    else if(isFile	== 1){
        printString(argv[0]);
    	printString(" is not a file.");
    }
    else
    {
    	printString("File doesn't exist.");
    }
	returnToSender();
	return 0;
}