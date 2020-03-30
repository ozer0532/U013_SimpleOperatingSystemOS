int main()
{
    interrupt(0x21, 0, "Hello World\r\n", 0, 0);
    returnToSender();
    return 0;
}