; Program 4.4
; Array - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data
array: DD 1, 2, 3, 4

SECTION .text
global _main
_main:

; Load using byte offsets
lea rsi, [rel array]
mov eax, [rsi]
mov ebx, [rsi + 4]

; Save using indices
mov rdx, 2
mov DWORD [rsi + rdx * 4], 10
mov rdx, 3
mov DWORD [rsi + rdx * 4], 20

mov rax, 60
xor rdi, rdi
syscall
