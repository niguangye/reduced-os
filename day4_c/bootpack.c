void io_hlt(void);
void write_mem8(int addr, int data);
void draw(int addr, int data);

void _start(void)
{
	int i;
	
	for (i = 0xa2; i <= 0x6de; i++) {
		draw(i, i & 0x0f);
	}
	
	io_hlt();

}
