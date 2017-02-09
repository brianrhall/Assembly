; Program C.1
; Template - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
num: dd 80

SECTION .bss
sum: resd 1

SECTION .text
global _main
_main:
mov eax, [num]
add eax, 20
mov [sum], eax

mov eax, 1
mov ebx, 0
int 80h
