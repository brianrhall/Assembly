; Program 5.2
; Looping - NASM (32-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .text
global _main
_main:

xor eax, eax
mov ecx, 5

myLoop:
  inc eax
  loop myLoop

mov eax, 1
mov ebx, 0
int 80h
