// Returns the string typed by the keyboard after 'Enter'
// Change the starting position using [0xb0, 0xb0, <start_pos>, <start_string>]
// When arrow key is pressed, returns [0x00, <arrow_key_code>]
void readString(char *string) {
	char inputHigh;
	char inputLow;
	int charInput;
	int pos = 0;
	char copyUntil;

	// Interrupt for reading keystroke (16), getting AX value
	charInput = interrupt(0x16, 0, 0, 0, 0);

	// Check for start index payload (░░ - 0xB0B0)
	if (string[0] == 0xb0 && string[1] == 0xb0) {
		copyUntil = string[2];
		while (pos < copyUntil) {
			string[pos] = string[pos + 3];
			pos++;
		}
	}
	
	// Get AH
	inputHigh = charInput >> 8;

	// Get AL
	inputLow = charInput & 0x00FF;

	// If character not return / up/ down arrow...
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

	// If up/down arrow is read (AL = 0x00)
	if(inputLow == 0x00)
	{
		// Clear typed string on screen and in buffer
		while (pos > 0) {
			// Clear previous character
			interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			interrupt(0x10, 0xe00 + ' ', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			interrupt(0x10, 0xe00 + '\b', 0xF, 0, 0);	// int 10=Video; AH 0e=TTY Output; BL 0F=White Front
			
			// Replace deleted character with NULL (0)
			string[--pos] = 0;
		}

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