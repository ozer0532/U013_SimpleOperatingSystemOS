int main()
{
    int n;
    int i;
    char name[15];
    char isFolder;

    char currentDir;
    char argc;
    char *argv[16];

    getParameters(&currentDir, &argc, argv);

    if (argc != 0) {
        printString("Usage: ls");
        returnToSender();
        return 0;
    }

    listContent(currentDir, &n);
    for (i = 0; i < n; i++) {
        getContentInFolder(i, name, &isFolder);
        printString(name);
        if (isFolder) {
            printString("/");
        }
        printString("\r\n");
    }


    
    returnToSender();
    return 0;
}
