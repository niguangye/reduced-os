; naskfunc
; TAB=4

[BITS 32]						; 32ビットモード用の機械語を作らせる

GLOBAL	io_hlt
GLOBAL  write_mem8
GLOBAL  draw

[SECTION .text]

io_hlt:	; void io_hlt(void);
		HLT
		RET

write_mem8:	; void write_mem8(int addr, int data);
		MOV		ECX,[ESP+4]		; [ESP+4]にaddrが入っているのでそれをECXに読み込む
		MOV		AL,[ESP+8]		; [ESP+8]にdataが入っているのでそれをALに読み込む
		MOV		[ECX],AL
		RET
		
draw:

	mov	edi, [ESP+4]	; 屏幕第11行， 第79列
	mov al, [ESP+8]
	mov	[gs:edi], ax
	ret