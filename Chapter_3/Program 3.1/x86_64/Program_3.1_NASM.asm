; Program 3.1
; Sample Assembly Program - NASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

SECTION .data 
sum: DQ 0

SECTION .text
global _main
_main:
mov rax, 25
mov rbx, 50 
add rax, rbx
mov QWORD [sum], rax

mov rax, 60
xor rdi, rdi
syscall
