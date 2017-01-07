; Program D.1
; sum - NASM (32-bit) on Linux
; Copyright (c) 2017 Hall & Slonka

; nasm -f elf32 -o sum.o -l sum.lst sum.asm
; ld -e _main -melf_i386 -o sum sum.o

section .data
num1: dd 2
num2: dd 4

section .text
global _main, _sum
_main:

mov eax, 10
dec eax
mov ebx, 5

push DWORD[num2]
push DWORD[num1]
call _sum
add esp, 8

mov eax, 1
mov ebx, 0
int 80h

_sum:
push ebp
mov ebp, esp
push ebx
mov ebx, [ebp + 8]
mov eax, [ebp + 12]
add eax, ebx
pop ebx
pop ebp
ret
