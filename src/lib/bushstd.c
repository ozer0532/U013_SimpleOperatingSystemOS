char paramsInput[512];

void getParameters(char *currentDirectory, char *argc, char **argv) {
    int i;

    interrupt(0x21, 0x02, paramsInput, 0x403, 0);
    *currentDirectory = paramsInput[0];
    for (i = 1; i < 16; i++) {
        if (paramsInput[i] == 0) {
            *argc = i-1;
            return;
        }
        argv[i-1] = paramsInput + paramsInput[i];
    }
}