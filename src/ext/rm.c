int main()
{
    int i;
    char name[15];
    int isFolder;

    char currentDir;
    char argc;
    char *argv[16];

    getParameters(&currentDir, &argc, argv);

    if (argc != 1) {
        printString("Usage: ls <filename>");
        returnToSender();
        return 0;
    }

    isFolder = isPathFolder(argv[0], currentDir);

    if (isFolder == -1) {
        printString("Not a file or directory");
        returnToSender();
        return 0;
    } else if (isFolder == 0) {
        deleteFile(argv[0], &i, currentDir);
    } else {
        deleteFolder(argv[0], currentDir);
    }

    // listContent(currentDir, &n);
    // for (i = 0; i < n; i++) {
    //     getContentInFolder(i, name, &isFolder);
    //     printString(name);
    //     if (isFolder) {
    //         printString("/");
    //     }
    //     printString("\r\n");
    // }


    
    returnToSender();
    return 0;
}
