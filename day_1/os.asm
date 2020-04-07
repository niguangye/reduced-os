; haribote-os
; TAB=4

		ORG		0xc200			; このプログラムがどこに読み込まれるのか

		MOV		AL,0x13			; VGAグラフィックス、320x200x8bitカラー
		MOV		AH,0x00
		INT		0x10

		jmp 	entry
	
; Boot kernel
entry:
    ; Init register
    MOV     AX, 0
    MOV     SS, AX
    MOV     SP, 0x7c00
    MOV     DS, AX
    MOV     ES, AX
    MOV     SI, msg
	
; Loop: print string with interrupt
print:
    MOV     AL, [SI]
    ADD     SI, 1
    CMP     AL, 0
    JE      end
    MOV     AH, 0x0e
    MOV     BX, 15
    INT     0x10
    JMP     print
	
; msg
msg:
    DB      0x0a, 0x0a, 0x0a
    DB      "Hello,world!"
    DB      0x0a
    DB      0
	
; Wait
end:
    HLT
    JMP     end
	
	
