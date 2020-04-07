
ipl10.img: ipl10.asm
	nasm -f bin ipl10.asm -o ipl10.img
	
os.img: os.asm
	nasm -f bin os.asm -o os.img 

build: ipl10.img os.img
	dd if=os.img of=ipl10.img seek=33 bs=512 count=2879 
	
clean:
	rm -rf *.img 