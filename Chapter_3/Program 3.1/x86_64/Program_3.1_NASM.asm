; Program 3.1
; Sample Assembly Program - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data
sum: DD 0

SECTION .text
global _main
_main:
mov eax, 25
mov ebx, 50
add eax, ebx
mov DWORD [rel sum], eax

mov rax, 60
xor rdi, rdi
syscall
