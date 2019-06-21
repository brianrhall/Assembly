; Program 4.1
; Addition and Subtraction - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data
sum: DD 0
val: DD 25

SECTION .text
global _main
_main:

mov eax, 0
inc eax
add eax, 200
sub eax, [rel val]
mov [rel sum], eax
dec DWORD [rel sum]
neg DWORD [rel sum]

mov rax, 60
xor rdi, rdi
syscall
