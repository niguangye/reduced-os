# 默认
all: run

# 编译主引导记录
mbr.bin: mbr.asm
	nasm -f bin mbr.asm -o mbr.bin

# 编译内核加载器
loader.bin: loader.asm
	nasm -f bin loader.asm -o loader.bin

# 编译内核
kernel.bin: kernel.asm
	nasm -f elf kernel.asm -o kernel.o
	ld -m elf_i386 -s -Ttext 0x30400 -o kernel.bin kernel.o

# 生成空镜像文件
os.img: 
	bximage -fd=1.44M -mode="create" -q os.img

# 复制MBR、内核加载器到空镜像文件相应位置
build: mbr.bin loader.bin os.img 
	dd if=mbr.bin of=os.img bs=512 count=1 conv=notrunc
	dd if=loader.bin of=os.img bs=512 seek=33 conv=notrunc
	
# 复制编译成功的镜像到bochs目录
run: build
	cp -f os.img ../bochs
	
# 清理编译的中间文件、镜像文件
clean:
	rm -rf *.o *.img *.bin bootpack