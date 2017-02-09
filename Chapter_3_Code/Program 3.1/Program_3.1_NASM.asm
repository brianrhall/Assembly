; Program 3.1
; Sample Assembly Program - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
sum: DD 0

SECTION .text
global _main
_main:
mov eax, 25
mov ebx, 50
add eax, ebx
mov DWORD [sum], eax

mov eax, 1
mov ebx, 0
int 80h
