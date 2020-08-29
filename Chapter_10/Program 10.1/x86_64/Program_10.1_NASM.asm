; Program 10.1
; Using Segment Selectors - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

section .data
array: dd 3, 2, 6, 4, 1

section .text
global _main
_main:

mov rax, array		; array address to rax
mov ebx, [eax+4]	; second element to ebx
mov ecx, [ds:array]	; first element to ecx (assembler warning)
mov edx, [ds:array+8]	; third element to edx (assembler warning)
; "warning: ds segment base generated, but will be ignored in 64-bit mode"

mov rax, 60
xor rdi, rdi
syscall
