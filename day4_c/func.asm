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
		MOV		ECX,[ESP+4]		; [ESP+4]第一个参数
		MOV		AL,[ESP+8]		; [ESP+8]第二个参数
		MOV		[ECX],AL
		RET
		
draw:

	mov	edi, [ESP+4]	; [ESP+4]第一个参数
	mov al, [ESP+8]		; [ESP+8]第二个参数
	mov	[gs:edi], ax
	ret