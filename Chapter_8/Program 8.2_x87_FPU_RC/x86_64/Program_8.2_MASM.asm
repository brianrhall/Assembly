; Program 8.2
; x87 FPU Rounding Control - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
default_cw  WORD 0000h
nearest     WORD 0000h
down        WORD 0400h
up          WORD 0800h
zero        WORD 0C00h
result      QWORD ?

.code
_main PROC

finit			; initialize FPU
fstcw default_cw	; store initialized control word in default
mov ax, default_cw	; move default control word to AX register
and ah, 11110011b	; clear RC field (bits 10 and 11)
or nearest, ax		; set RC bits to 00 and store in nearest
or down, ax		; set RC bits to 01 and store in down
or up, ax		; set RC bits to 10 and store in up
or zero, ax		; set RC bits to 11 and store in zero

xor ax, ax		; sequence to verify bits
mov ax, default_cw
mov ax, nearest
mov ax, down
mov ax, up
mov ax, zero

fldcw nearest		; set desired rounding mode

fldpi			; load pi on the stack
frndint 		; round to integer (uses rounding mode)
fistp result		; store from FPU stack to memory
mov rax, result		; mov rounded result to RAX

xor rcx, rcx
call ExitProcess
_main ENDP
END
