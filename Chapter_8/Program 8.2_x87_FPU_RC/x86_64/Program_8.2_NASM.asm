; Program 8.2
; x87 FPU Rounding Control - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

section .data
default_cw:  dw 0000h
nearest:     dw 0000h
down:        dw 0400h
up:          dw 0800h
zero:        dw 0C00h

section .bss
result: resq 1

section .text
global _main
_main:

finit				; initialize FPU
fstcw WORD [rel default_cw]	; store initialized control word in default
mov ax, [rel default_cw]	; move default control word to AX register
and ah, 11110011b		; clear RC field (bits 10 and 11)
or [rel nearest], ax		; set RC bits to 00 and store in nearest
or [rel down], ax		; set RC bits to 01 and store in down
or [rel up], ax			; set RC bits to 10 and store in up
or [rel zero], ax		; set RC bits to 11 and store in zero

xor ax, ax			; sequence to verify bits
mov ax, [rel default_cw]
mov ax, [rel nearest]
mov ax, [rel down]
mov ax, [rel up]
mov ax, [rel zero]

fldcw [rel nearest]		; set desired rounding mode

fldpi				; load pi on the stack
frndint 			; round to integer (uses rounding mode)
fistp QWORD [rel result]	; store from FPU stack to memory
mov rax, [rel result]		; mov rounded result to RAX

mov rax, 60
xor rdi, rdi
syscall
