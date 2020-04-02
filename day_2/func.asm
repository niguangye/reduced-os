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
		MOV		ECX,[ESP+4]		; [ESP+4]��addr�������Ă���̂ł����ECX�ɓǂݍ���
		MOV		AL,[ESP+8]		; [ESP+8]��data�������Ă���̂ł����AL�ɓǂݍ���
		MOV		[ECX],AL
		RET
		
draw:

	mov	edi, (80 * 10 + 49) * 2	; ������11�s�C ��79��
	mov ah,	0ch		; 0000:�K��	1100�F?��
	mov al, 'x'
	mov	[gs:edi], ax
	jmp $