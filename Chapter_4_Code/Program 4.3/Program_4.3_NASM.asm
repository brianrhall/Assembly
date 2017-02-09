; Program 4.3
; Negative Division - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .text
global _main
_main:

mov eax, -534
cdq
mov ebx, 15
idiv ebx

mov eax, 1
mov ebx, 0
int 80h
