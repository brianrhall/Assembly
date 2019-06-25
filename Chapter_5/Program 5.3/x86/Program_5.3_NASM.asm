; Program 5.3
; Nested for Loop - NASM (32-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .text
global _main
_main:

xor eax, eax
mov ebx, 2
outer:
   mov ecx, 3
      inner:
      inc eax
      dec ecx
      cmp ecx, 0
      jne inner
   dec ebx
   cmp ebx, 0
   jne outer

mov eax, 1
mov ebx, 0
int 80h
