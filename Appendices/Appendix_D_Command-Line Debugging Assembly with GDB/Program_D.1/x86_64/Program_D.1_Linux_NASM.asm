; Program D.1
; sum - NASM (64-bit) on Linux
; Copyright (c) 2019 Hall & Slonka

; nasm -f elf64 -o sum.o -l sum.lst sum.asm
; ld -e _main -melf_x86_64 -o sum sum.o

section .data
num1: dq 2
num2: dq 4

section .text
global _main, _sum
_main:

mov rax, 10
dec rax
mov rbx, 5

lea rdi, [rel num1]
lea rsi, [rel num2]
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
mov rax, [rdi]
add rax, [rsi]
pop rbx
pop rbp
ret
