void printString(char *string);
void printInteger(int n);



int main()
{

}

// Outputs string
void printString(char *string) {
	char * pointer = string;

	// While not NULL...
	while (*pointer != 0x00) {
		interrupt(0x10, 0x0e00 + *pointer, 0x000F, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
		pointer++;
	}
}

// Outputs integer
void printInteger(int n) {
	int tmp = n;
    int i;
    int length = 1;
	char number[5];
	char isNegative = 0;

    // If n is 0...
	if(n == 0) {
        printString("0");
        return;
    }
    
    // If is negative...
    if(tmp<0)
    {
    	isNegative = 1;
    	tmp = -tmp;
    }

    // Check length of int
    while(tmp>10)
    {
        tmp = div(tmp, 10);
        ++length;
    }

    tmp = n;
	if (isNegative) {
		tmp = -tmp;
	}

	for(i=length-1;i>=0;i--)
	{
		number[i] = mod(tmp,10) + '0';
		tmp = div(tmp, 10);
	}
    number[length] = 0;

    if(isNegative) printString("-");
    printString(number);
}

void printHexa(char n)
{
	char number[3];
	number[2] = 0;

	number[0] = div(n, 16);
	number[0] = number[0] >= 10 ? (number[0]-10) + 'A' : number[0] + '0';

	number[1] = mod(n, 16);
	number[1] = number[1] >= 10 ? (number[1]-10) + 'A' : number[1] + '0';

	printString(number);

}

int strlen(const char* s)
{
    int length = 0;
    int i = 0;
    
    while(s[i]!=0x00)
    {
        length++;
        i++;
    }

    return length++;
}

int strcmp(const char* s1, const char* s2)
{
   while(*s1)
   {
       if(*s1 != *s2) break;
       *s1++;
       *s2++;
   }

    return  *(const unsigned char*)s1 - *(const unsigned char*)s2;
}