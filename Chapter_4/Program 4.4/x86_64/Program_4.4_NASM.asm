; Program 4.4
; Array - NASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

SECTION .data
array: DQ 1, 2, 3, 4

SECTION .text 
global _main
_main:

; Load using byte offsets
lea rsi, [array]
mov rax, [rsi]
mov rbx, [rsi + 8]

; Save using indices 
mov rdx, 2
mov QWORD [array+rdx*8], 10 
mov rdx, 3
mov QWORD [array+rdx*8], 20

mov rax, 60
xor rdi, rdi
syscall
