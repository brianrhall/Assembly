; Program 5.1
; Conditional Jump - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data
wages: DD 46000

SECTION .bss
taxes: RESD 1

SECTION .text
global _main
_main:

 mov eax, 50000
 cmp DWORD [rel wages], eax
 jae higher
 mov DWORD [rel taxes], 2000
 jmp done

higher:
 mov DWORD [rel taxes], 4000

done:
mov rax, 60
xor rdi, rdi
syscall
