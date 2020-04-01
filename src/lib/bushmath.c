// Modulo operation
int mod(int x, int y)
{
    interrupt(0x21, 0x0B, 0, x, y);
}

// Divide operation
int div(int x, int y)
{
    interrupt(0x21, 0x0C, 0, x, y);
}
