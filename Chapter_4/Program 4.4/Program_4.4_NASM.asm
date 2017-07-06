; Program 4.4
; Array - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
array: DD 1, 2, 3, 4

SECTION .text
global _main
_main:

; Load using byte offsets
mov eax, [array]
mov ebx, [array + 4]

; Save using indices
mov edx, 2
mov DWORD [array + edx * 4], 10
mov edx, 3
mov DWORD [array + edx * 4], 20

mov eax, 1
mov ebx, 0
int 80h
