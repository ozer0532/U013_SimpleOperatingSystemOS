// #include "bushtextio.h"

// Outputs string
void printString(char *string) {
    // Use interrupt 0x21 to call kernel printString
	interrupt(0x21, 0x00, string, 0, 0);
}

// // Outputs integer
// void printInteger(int n) {
// 	int tmp = n;
//     int i;
//     int length = 1;
// 	char number[5];
// 	char isNegative = 0;

//     // If n is 0...
// 	if(n == 0) {
//         printString("0");
//         return;
//     }
    
//     // If is negative...
//     if(tmp<0)
//     {
//     	isNegative = 1;
//     	tmp = -tmp;
//     }

//     // Check length of int
//     while(tmp>10)
//     {
//         tmp = div(tmp, 10);
//         ++length;
//     }

//     tmp = n;
// 	if (isNegative) {
// 		tmp = -tmp;
// 	}

// 	for(i=length-1;i>=0;i--)
// 	{
// 		number[i] = mod(tmp,10) + '0';
// 		tmp = div(tmp, 10);
// 	}
//     number[length] = 0;

//     if(isNegative) printString("-");
//     printString(number);
// }

// void printHexa(char n)
// {
// 	char number[3];
// 	number[2] = 0;

// 	number[0] = div(n, 16);
// 	number[0] = number[0] >= 10 ? (number[0]-10) + 'A' : number[0] + '0';

// 	number[1] = mod(n, 16);
// 	number[1] = number[1] >= 10 ? (number[1]-10) + 'A' : number[1] + '0';

// 	printString(number);

// }

// int strlen(char* s)
// {
//     int length = 0;
//     int i = 0;
    
//     while(s[i]!=0x00)
//     {
//         length++;
//         i++;
//     }

//     return length++;
// }

// int strcmp(char* s1, char* s2)
// {
//    while(*s1)
//    {
//        if(*s1 != *s2) break;
//        *s1++;
//        *s2++;
//    }

//     return  *(unsigned char*)s1 - *(unsigned char*)s2;
// }