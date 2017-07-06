; Program D.1
; sum - NASM (32-bit) on macOS
; Copyright (c) 2017 Hall & Slonka

; nasm -f macho -o sum.o -l sum.lst sum.s
; clang -o sum -m32 sum.o

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

push DWORD 0
sub esp, 4
mov eax, 1
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
