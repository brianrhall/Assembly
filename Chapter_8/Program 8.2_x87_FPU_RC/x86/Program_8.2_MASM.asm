; Program 8.2
; x87 FPU Rounding Control - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.686
.MODEL FLAT, C
.STACK 4096

ExitProcess PROTO stdcall, dwExitCode:DWORD

.data
default_cw  WORD 0000h
nearest     WORD 0000h
down        WORD 0400h
up          WORD 0800h
zero        WORD 0C00h
result      DWORD ?

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
fist result		; store from FPU stack to memory
mov eax, result		; mov rounded result to EAX

INVOKE ExitProcess, 0
_main ENDP
END
