; Program H.2
; Decimal Adjust after Addition - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD

.DATA
.CODE
_main PROC
    
xor ax, ax    ; clear AX
xor bx, bx    ; clear BX
mov al, 42h   ; 42 decimal = 2A hex
add al, 68h   ; 68 decimal = 44 hex
daa           ; 110 decimal = 6E hex
              ; CF = 1, AL = 10
adc bx, 0     ; BX = 0 + BX(0) + CF
cmp bx, 0     ; if CF set(1)
jz done
carry:
add ah, 1     ; set next byte to 1

done:
INVOKE ExitProcess, 0
_main ENDP
END
