; Program 9.3
; Addition Macro - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

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

mov rax, 60
xor rdi, rdi
syscall
