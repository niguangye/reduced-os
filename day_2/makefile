
ipl.img: ipl.asm
	nasm -f bin ipl.asm -o ipl.img
	
loader.bin: loader.asm
	nasm -f bin loader.asm -o loader.bin
	
bootpack.o: bootpack.c
	gcc -Wall -m32 -c bootpack.c -o bootpack.o

func.o: func.asm
	nasm -f elf func.asm -o func.o

bootpack: bootpack.o func.o
	ld -m elf_i386 bootpack.o func.o -o bootpack

bootpack.bin: bootpack
	objcopy -S -O binary bootpack bootpack.bin

a.bin: loader.bin bootpack.bin
	cat loader.bin bootpack.bin >> a.bin	

os.img: 
	bximage -fd=1.44M -mode="create" -q os.img

build: a.bin ipl.img os.img
	dd if=a.bin of=os.img bs=512 seek=33 conv=notrunc
	dd if=ipl.img of=os.img bs=512 count=1 conv=notrunc
	
clean:
	rm -rf *.o *.img *.bin bootpack