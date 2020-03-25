char isStringEqual(char *a, char *b, int length) {
	int i;

	for (i = 0; i < length; i++) {
		if (a[i] != b[i]) {
			// printString(a);
			// printString(b);
			// printString("\r\n");
			return 0;
		}
		if (a[i] == 0) {
			printString("\rw");
			return 1;
		}
	}
	return 1;
}

char isStringStartsWith(char *a, char *b, int length) {
	int i;

	for (i = 0; i < length; i++) {
		if (b[i] == 0) {
			return 1;
		}
		if (a[i] != b[i]) {
			return 0;
		}
	}

	return 1;
}

int stringLength(char *string, int max) {
	int length = 0;
	while (string[length] != 0 && length < max) {
		length++;
	}
	return length;
}
