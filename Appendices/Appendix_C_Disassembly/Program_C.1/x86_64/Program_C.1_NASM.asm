; Program C.1
; Template - NASM (64-bit)
; Copyright (c) 2018 Hall & Slonka

SECTION .data
num: dq 80

SECTION .bss
sum: resq 1

SECTION .text
global _main

_main:
mov rax, [rel num]
add rax, 20
mov [rel sum], rax

mov rax, 60
xor rdi, rdi
syscall
