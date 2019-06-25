; Program 5.4
; while Loop - NASM (32-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .text
global _main
_main:

mov eax, 30
while_loop:
   cmp eax, 50
   jae done
   inc eax
   jmp while_loop
done:

mov eax, 1
mov ebx, 0
int 80h
