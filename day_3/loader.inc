; ############################
; 	Macros
; ############################

; 描述符类型
DA_32		equ	4000h	; 32 位段
DA_LIMIT_4K	equ	8000h	; 段界限粒度为 4K 字节

; 存储段描述符类型
DA_DR		equ	90h	; 存在的只读数据段类型值
DA_DRW		equ	92h	; 存在的可读写数据段属性值
DA_C		equ	98h	; 存在的只执行代码段属性值
DA_CR		equ	9Ah	; 存在的可执行可读代码段属性值

; Descriptor macro
%macro Descriptor 3
	dw	%2 & 0FFFFh				; Limit 1 段界限1
	dw	%1 & 0FFFFh				; Base addr 1 段基址1
	db	(%1 >> 16) & 0FFh			; Base addr 2 段基址2
	dw	((%2 >> 8) & 0F00h) | (%3 & 0F0FFh)	; Attr 1 + Limit 2 + Attr 2 属性1 + 段界限2 + 属性2
	db	(%1 >> 24) & 0FFh			; Base addr 3 段基址3
%endmacro