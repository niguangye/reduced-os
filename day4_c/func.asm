; naskfunc
; TAB=4

[BITS 32]						; 32�r�b�g���[�h�p�̋@�B�����点��

GLOBAL	io_hlt
GLOBAL  write_mem8
GLOBAL  draw

[SECTION .text]

io_hlt:	; void io_hlt(void);
		HLT
		RET

write_mem8:	; void write_mem8(int addr, int data);
		MOV		ECX,[ESP+4]		; [ESP+4]��꘢�Q��
		MOV		AL,[ESP+8]		; [ESP+8]��񘢎Q��
		MOV		[ECX],AL
		RET
		
draw:

	mov	edi, [ESP+4]	; [ESP+4]��꘢�Q��
	mov al, [ESP+8]		; [ESP+8]��񘢎Q��
	mov	[gs:edi], ax
	ret