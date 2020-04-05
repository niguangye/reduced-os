void io_hlt(void);
void write_mem8(int addr, int data);
void draw(int addr, int data);

void _start(void)
{
	
	int i; /* 変数宣言。iという変数は、32ビットの整数型 */
	char *p;
	for (i = 0xa2; i <= 0x6de; i++) {
		// draw(i, i & 0x0f);
		p = (char * ) 0x0b8000 +  i;
		*p = 0xd500;
	}

	for (;;) {
		io_hlt();
	}
}
