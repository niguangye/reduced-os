
ipl.img: ipl.asm
	nasm -f bin ipl.asm -o ipl.img
	
loader.bin: loader.asm
	nasm -f bin loader.asm -o loader.bin
	
a.bin: loader.bin
	cat loader.bin >> a.bin	

os.img: 
	bximage -fd=1.44M -mode="create" -q os.img

build: a.bin ipl.img os.img
	dd if=a.bin of=os.img bs=512 seek=33 conv=notrunc
	dd if=ipl.img of=os.img bs=512 count=1 conv=notrunc
	cp os.img ../bochs/os.img

clean:
	rm -rf *.o *.img *.bin bootpack