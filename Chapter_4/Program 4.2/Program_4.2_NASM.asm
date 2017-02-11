; Program 4.2
; Multiplication and Division - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
mval: DD 664751
dval: DD 8

SECTION .text
global _main
_main:

; MUL 1-op
mov eax, [mval]
mov ebx, 8
mul ebx

; IMUL 1-op
mov eax, [mval]
mov ebx, 8
imul ebx

; IMUL 2-op
mov eax, 8
imul eax, [mval]

; IMUL 3-op
imul eax, [mval], 8

; DIV 1-op
mov edx, 0
mov eax, 5318008
mov ecx, [dval]
div ecx

; IDIV 1-op
mov edx, 0
mov eax, 5318008
mov ecx, [dval]
idiv ecx

mov eax, 1
mov ebx, 0
int 80h
