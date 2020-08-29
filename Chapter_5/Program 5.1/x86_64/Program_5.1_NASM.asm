; Program 5.1
; Conditional Jump - NASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

SECTION .data 
wages: DQ 46000

SECTION .bss
taxes: RESQ 1

SECTION .text 
global _main
_main:

mov rax, 50000
cmp QWORD [wages], rax 
jae higher
mov QWORD [taxes], 2000 
jmp done

higher:
mov QWORD [taxes], 4000

done:
mov rax, 60
xor rdi, rdi
syscall
