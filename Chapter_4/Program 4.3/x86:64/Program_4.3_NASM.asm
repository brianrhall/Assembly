; Program 4.3
; Negative Division - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .text
global _main
_main:

mov eax, -534
cdq
mov ebx, 15
idiv ebx

mov rax, 60
xor rdi, rdi
syscall
