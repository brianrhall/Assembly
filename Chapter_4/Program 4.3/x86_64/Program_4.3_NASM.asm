; Program 4.3
; Negative Division - NASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

SECTION .text
global _main
_main:

mov rax, -534 
cqo
mov rbx, 15 
idiv rbx

mov rax, 60
xor rdi, rdi
syscall
