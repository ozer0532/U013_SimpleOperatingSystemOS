int main()
{
    interrupt(0x21, 0, "Hello World\r\n", 0, 0);
    interrupt(0x21, 7, "KERNEL", 0, 0);
}