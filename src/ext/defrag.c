void arrcpy(char* src, char* dest, int length);

int main () {
    char map[512];
    char files[1024];
    char sectors[512];

    int i, j, k;

    // Load data
    interrupt(0x21, 0x02, map, 0x100, 0);
    interrupt(0x21, 0x02, files, 0x101, 0);
    interrupt(0x21, 0x02, files + 512, 0x102, 0);
    interrupt(0x21, 0x02, sectors, 0x103, 0);

    // Defrag files
    j = 0;
    for (i = 1; i < 64; i++) {
        if (files[i * 16 + 2] != 0) {
            if (files[j * 16 + 2] == 0) {
                arrcpy(files + i * 16, files + j * 16, 16);     // Copy to empty slot
            }
            j++;
        } else {
            if (files[j * 16 + 2] != 0) {   // Go to nearest empty slot
                j++;
            }
        }
    }

    // Defrag sectors
    j = 0;
    for (; j < 32; j++) {      // Find empty slot
        if (sectors[j * 16] == 0) {
            break;
        }
    }
    for (i = 0; i < 64; i++) {
        if (files[i * 16 + 2] == 0) {   // Traversal complete
            break;
        }
        if (files[i * 16 + 1] > j) {
            arrcpy(sectors + files[i * 16 + 1] * 16, sectors + j * 16, 16); // Copy to empty slot
            files[i * 16 + 1] = j;

            for (; j < 32; j++) {      // Find empty slot
                if (sectors[j * 16] == 0) {
                    break;
                }
            }
        }
    }

    // Defrag map
    k = 0;
    for (; k < 256; k++) {      // Find empty slot
        if (map[k] == 0) {
            break;
        }
    }
    for (i = 0; i < 32; i++) {
        if (sectors[i * 16] == 0) {   // Traversal complete
            break;
        }
        for (j = 0; j < 16; j++) {
            if (sectors[i * 16 + j] == 0) {   // End of file
                break;
            } else if (sectors[i * 16 + j] > k) {
                map[k] = map[sectors[i * 16 + j]];
                sectors[i * 16 + j] = k;

                for (; k < 256; k++) {      // Find empty slot
                    if (map[k] == 0) {
                        break;
                    }
                }
            }
        }
    }

    interrupt(0x21, 0x00, "Defrag completed\n", 0, 0);

    // Save data
    interrupt(0x21, 0x03, map, 0x100, 0);
    interrupt(0x21, 0x03, files, 0x101, 0);
    interrupt(0x21, 0x03, files + 512, 0x102, 0);
    interrupt(0x21, 0x03, sectors, 0x103, 0);

    returnToSender();
    return 0;
}

void arrcpy(char* src, char* dest, int length) {
    int i;
    for (i = 0; i < length; i++) {
        dest[i] = src[i];
    }
}