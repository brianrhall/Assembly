; Program 5.1
; Conditional Jump - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
wages: DD 46000

SECTION .bss
taxes: RESD 1

SECTION .text
global _main
_main:

 mov eax, 50000
 cmp DWORD [wages], eax
 jae higher
 mov DWORD [taxes], 2000
 jmp done

higher:
 mov DWORD [taxes], 4000

done:
mov eax, 1
mov ebx, 0
int 80h
