; Program 6.1
; Sum Program - NASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

section .data
num1: dd 2
num2: dd 4

section .text
global _main, _sum
_main:

mov rax, 10
dec rax
mov rbx, 5

movsx rdi, DWORD [rel num1]
movsx rsi, DWORD [rel num2]
call _sum

add rax, rbx
dec rax

mov rax, 60
xor rdi, rdi
syscall

_sum:
push rbp
mov rbp, rsp
push rbx
mov rax, rdi
add rax, rsi
pop rbx
pop rbp
ret
