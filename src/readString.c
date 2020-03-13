void readString(char *string) {
	char inputHigh;
	char inputLow;

	// Interrupt for reading keystroke (16), getting AX value
	int charInput = interrupt(0x16, 0, 0, 0, 0);
	
	// Initialize buffer position
	int pos = 0;

	// Find first position not empty
	while(string[pos]!=0) pos++;
	
	// Get AH
	inputHigh = charInput >> 8;

	// Get AL
	inputLow = (char) charInput;

	// If character not return...
	while (inputLow != '\r' && inputHigh != 0x48 && inputHigh != 0x50) {

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

	// If up.down arrow is read (AL = 0x00)
	if(inputLow == 0x00)
	{
		// Set buffer to NULL to prevent checking
		string[0] = 0;

		// Set second char to AH value
		string[1] = inputHigh;

		return;
	}

	// CRLF
	interrupt(0x10, 0xe00 + '\n', 0xF, 0, 0);		// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
	interrupt(0x10, 0xe00 + '\r', 0xF, 0, 0);		// int 10=Video; AH 0e=TTY Output; BL 0F=White Front

	string[pos] = 0;
}