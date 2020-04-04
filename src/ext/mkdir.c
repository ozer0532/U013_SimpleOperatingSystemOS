int main()
{
    int isFolder;
	char currentDir;
    char argc;
    char *argv[16];

    getParameters(&currentDir, &argc, argv);

    if (argc != 1) {
        printString("Usage: mkdir <foldername>");
        returnToSender();
        return 0;
    }

    isFolder = isPathFolder(argv[0], currentDir);

    if (isFolder == -1) {
        createFolder(argv[0], currentDir);
        printString("Folder ");
        printString(argv[0]);
        printString(" created.");
    } else if (isFolder == 1) {
        printString("Folder ");
        printString(argv[0]);
        printString(" already exists.");
    }
    returnToSender();
    return 0;
}