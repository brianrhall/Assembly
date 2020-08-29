; Program 4.1
; Addition and Subtraction - NASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

SECTION .data 
sum: DQ 0
val: DQ 25

SECTION .text 
global _main
_main:

mov rax, 0 
inc rax
add rax, 200 
sub rax, [val] 
mov [sum], rax 
dec QWORD [sum] 
neg QWORD [sum]

mov rax, 60
xor rdi, rdi
syscall
