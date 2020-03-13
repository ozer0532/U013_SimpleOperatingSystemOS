void readString(char *string) {
	char inputHigh;
	char inputLow;
	// Interrupt for reading keystroke (16)
	int charInput = interrupt(0x16, 0, 0, 0, 0);
	// Initialize buffer position
	int pos = 0;
	inputHigh = charInput >> 8;
	inputLow = charInput & 0x00FF;
	// charInput = charInput >> 8;
	
	// if(charInput == 48)
	// {
	// 	printString("dwdwdwdwd");
	// 	string[0] = 128;
	// 	return;
	// }
	// else if(charInput == 50)
	// {
	// 	string[0] = 129;
	// 	return;
	// }


	while (inputLow != '\r') {
		// If character is not backspace...
		if (inputLow != '\b')
		{
			string[pos++] = inputLow;
			interrupt(0x10, 0xe00 + inputLow, 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
		}
		// If character is backspace and position is not 0 (not at starting point)
		else if(pos>0)
		{
			// Clear previous character
			interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			interrupt(0x10, 0xe00 + ' ', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			
			// Replace deleted character with NULL (0)
			string[--pos] = 0;
		}
		charInput = interrupt(0x16, 0, 0, 0, 0);		// int 16=Keyboard; Ah 00=Get Keystroke Ret AH= char input
		inputHigh = charInput >> 8;
		inputLow = charInput & 0x00FF;
	} 
	// CRLF
	interrupt(0x10, 0xe00 + '\n', 0xF, 0, 0);		// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
	interrupt(0x10, 0xe00 + '\r', 0xF, 0, 0);		// int 10=Video; AH 0e=TTY Output; BL 0F=White Front

	string[pos] = 0;
}