void printString(char *string) {
	char * pointer = string;

	// While not NULL...
	while (*pointer != 0x00) {
		interrupt(0x10, 0x0e00 + *pointer, 0x000F, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
		pointer++;
	}
}

void printInteger(int n) {
	int tmp = n;
    int i;
    int length = 1;
	char number[11];

    // If n is 0...
	if(n == 0) {
        printString("0");
        return;
    }
    
    // Check length of int
    while(tmp!=0)
    {
        tmp = div(tmp/10);
        ++length;
    }

    tmp = n;

	for(i=length-1;i>=0;i--)
	{
		number[i] = mod(tmp,10) + '0';
		tmp = div(tmp, 10);
	}
    number[length] = 0;

    printString(number);
}

void printHexa(int n)
{
	char number[3];
	number[2] = 0;

	number[0] = div(n, 16);
	number[0] = number[0] >= 10 ? (number[0]-10) + 'A' : number[0] + '0';

	number[1] = mod(n, 16);
	number[1] = number[1] >= 10 ? (number[1]-10) + 'A' : number[1] + '0';

	printString(number);

}
