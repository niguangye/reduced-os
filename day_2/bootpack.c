void io_hlt(void);
void write_mem8(int addr, int data);
void draw(void);

void _start(void)
{
	draw();
}
