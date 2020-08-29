; Program 4.2
; Multiplication and Division - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data
mval: DD 664751
dval: DD 8

SECTION .text
global _main
_main:

; MUL 1-op
mov eax, [rel mval]
mov ebx, 8
mul ebx

; IMUL 1-op
mov eax, [rel mval]
mov ebx, 8
imul ebx

; IMUL 2-op
mov eax, 8
imul eax, [rel mval]

; IMUL 3-op
imul eax, [rel mval], 8

; DIV 1-op
mov edx, 0
mov eax, 5318008
mov ecx, [rel dval]
div ecx

; IDIV 1-op
mov edx, 0
mov eax, 5318008
mov ecx, [rel dval]
idiv ecx

mov rax, 60
xor rdi, rdi
syscall
