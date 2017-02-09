; Program 5.4
; while Loop - NASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .text
global _main
_main:

mov rax, 30
while:
   cmp rax, 50
   jae done
   inc rax
   jmp while
done:

mov rax, 60
xor rdi, rdi
syscall
