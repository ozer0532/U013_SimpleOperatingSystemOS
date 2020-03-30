// Outputs string
void printString(char *string) {
    // Use interrupt 0x21 to call kernel printString
	interrupt(0x21, 0x00, string, 0, 0);
}

// Reads string
void readString(char *string) {
    // Use interrupt 0x21 to call kernel readString
    interrupt(0x21, 0x01, string, 0, 0);
}
