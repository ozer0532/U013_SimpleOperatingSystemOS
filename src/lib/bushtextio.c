// Outputs string
void printString(char *string) {
    // Use interrupt 0x21 to call kernel printString
	interrupt(0x21, 0x00, string, 0, 0);
}
