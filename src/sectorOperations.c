void readSector(char *buffer, int sector) {
	// int 13=Disk; AH 02=Read Sector; AL 01=Read 1 sector; BX Output Buffer; CH Cylinder #; CL Sector #; DH Head #; DL Drive #
	interrupt(0x13, 0x201, buffer, div(sector, 36) * 0x100 + mod(sector, 18) + 1, mod(div(sector, 18), 2) * 0x100);
}

void writeSector(char *buffer, int sector) {
	// int 13=Disk; AH 03=Write Sector; AL 01=Read 1 sector; BX Input Buffer; CH Cylinder #; CL Sector #; DH Head #; DL Drive #
	interrupt(0x13, 0x301, buffer, div(sector, 36) * 0x100 + mod(sector, 18) + 1, mod(div(sector, 18), 2) * 0x100);
}

int getEmptySectorCount(char *buffer, int sectors) {
	int count;
	int i;

	count = 0;
	for (i = 0; i < sectors; i++) {
		if (buffer[i] == 0x00) {
			count++;
		}
	}
	return count;
}

int getFirstEmptySector(char *buffer, int sectors) {
	int i;
	for (i = 0; i < sectors; i++) {
		if (buffer[i] == 0x00) {
			return i;
		}
	}
}
