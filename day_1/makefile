
ipl10.img: ipl10.asm
	nasm -f ipl10.asm -o ipl10.img
	
os.img: os.asm
nasm -f bin os.asm -o os.img 

build:
	dd if=os.img of=ipl10.img seek=33 bs=512 count=2879 