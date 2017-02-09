; Program 4.1
; Addition and Subtraction - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
sum: DD 0
val: DD 25

SECTION .text
global _main
_main:

mov eax, 0
inc eax
add eax, 200
sub eax, [val]
mov [sum], eax
dec DWORD [sum]
neg DWORD [sum]

mov eax, 1
mov ebx, 0
int 80h
