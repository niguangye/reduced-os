; =======================
; pmtest1.asm
; 编译方法：nasm pmtest1.asm -o pmtest1.bin
; ========================

%include		"loader.inc"		;常量、宏以及一些说明

org		0c200h

		jmp		LABEL_BEGIN
		
[SECTION .gdt]
; GDT
;									段基址		段界限				属性
LABEL_GDT:			Descriptor	0,			0,					0		;空描述符
LABEL_DESC_CODE32:	Descriptor	0,			0xffff, 	DA_C + DA_32	;非一致代码段
LABEL_DESC_VIDEO:	Descriptor	0B8000h,	0ffffh,				DA_DRW	;显存首地址
; GDT 结束

GdtLen		equ		$ - LABEL_GDT		; GDT长度
GdtPtr		dw		GdtLen - 1			; GDT界限
			dd		0					; GDT基地址
			
; GDT选择子
SelectorCode32		equ		LABEL_DESC_CODE32	- LABEL_GDT
SelectorVideo		equ		LABEL_DESC_VIDEO	- LABEL_GDT
; END of [SECTION .gdt]


[SECTION .s16]
[BITS	16]
LABEL_BEGIN:
		
		mov ax, cs
		mov ds, ax
		mov es, ax
		mov ss, ax
		mov sp, 0100h
		
		;初始化32位代码段描述符
		xor	eax, eax 	;它比mov eax,0效率高，所以一般用它
		mov ax, cs
		shl eax, 4
		add eax, LABEL_SEG_CODE32
		mov word [LABEL_DESC_CODE32 + 2], ax
		shr	eax, 16
		mov byte [LABEL_DESC_CODE32 + 4], al
		mov byte [LABEL_DESC_CODE32 + 7], ah
		
		;为加载GDTR作准备
		xor	eax, eax
		mov ax, ds
		shl eax, 4
		add eax, LABEL_GDT	; eax <- gdt 基地址
		mov	dword [GdtPtr + 2], eax ; [GdtPtr + 2] <- gdt 基地址
		
		;加载GDTR
		lgdt	[GdtPtr]
		
		; 关中断
		cli
		
		; 打开地址线A20
		in al, 92h
		or al, 00000010b
		out	92h, al
		
		; 准备切换到保护模式
		mov eax, cr0
		or	eax, 1
		mov cr0, eax
		
		; 真正进入保护模式
		jmp	dword SelectorCode32:0	;执行这一句会把SelectorCode32 装入 cs,
									;并跳转到Code32Selector:0处
; END of [SECTION .s16]

[SECTION .s32] ;32位代码段，由实模式跳入
[BITS	32]

LABEL_SEG_CODE32:

	mov	ax, SelectorVideo
	mov	gs, ax	;视频段选择子（目的）
	
	mov	edi, (80 * 11 + 79) * 2	; 屏幕第11行， 第79列
	mov ah,	0ch		; 0000:黑底	1100：红字
	mov al, 'p'
	mov	[gs:edi], ax
	
	; 到此为止

	

; END of [SECTION .s32]
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		