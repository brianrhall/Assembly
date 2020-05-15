; Program 8.2
; x87 FPU Rounding Control - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
default_cw:  dw 0000h
nearest:     dw 0000h
down:        dw 0400h
up:          dw 0800h
zero:        dw 0C00h

section .bss
result: resd 1

section .text
global _main
_main:

finit			; initialize FPU
fstcw WORD [default_cw]	; store initialized control word in default
mov ax, [default_cw]	; move default control word to AX register
and ah, 11110011b	; clear RC field (bits 10 and 11)
or [nearest], ax	; set RC bits to 00 and store in nearest
or [down], ax		; set RC bits to 01 and store in down
or [up], ax		; set RC bits to 10 and store in up
or [zero], ax		; set RC bits to 11 and store in zero

xor ax, ax		; sequence to verify bits
mov ax, [default_cw]
mov ax, [nearest]
mov ax, [down]
mov ax, [up]
mov ax, [zero]

fldcw [nearest]		; set desired rounding mode

fldpi			; load pi on the stack
frndint 		; round to integer (uses rounding mode)
fist DWORD [result]	; store from FPU stack to memory
mov eax, [result]	; mov rounded result to EAX

mov eax, 1
mov ebx, 0
int 80h
