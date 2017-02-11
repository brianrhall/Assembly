; Program 9.3
; Addition Macro - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

%macro intAdd 3
   mov eax, [%2]
   add eax, [%3]
   mov [%1], eax
%endmacro

section .data
intA: dd 2
intB: dd 4
intC: dd 3
intD: dd 7
result: dd 0

section .text
global _main
_main:

	intAdd result, intA, intB
	intAdd result, intC, intD

mov eax, 1
mov ebx, 0
int 80h
