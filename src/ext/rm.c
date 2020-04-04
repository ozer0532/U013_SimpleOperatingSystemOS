int main()
{
    int i;
    int isFolder;

    char currentDir;
    char argc;
    char *argv[16];

    getParameters(&currentDir, &argc, argv);

    if (argc != 1) {
        printString("Usage: rm <filename>");
        returnToSender();
        return 0;
    }

    isFolder = isPathFolder(argv[0], currentDir);

    if (isFolder == -1) {
        printString("Not a file or directory");
    } else if (isFolder == 0) {
        deleteFile(argv[0], &i, currentDir);
    } else {
        deleteFolder(argv[0], currentDir);
    }
    
    returnToSender();
    return 0;
}
