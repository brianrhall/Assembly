; Program 10.1
; Using Segment Selectors - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
array: dd 3, 2, 6, 4, 1

section .text
global _main
_main:

mov eax, array		; array address to eax
mov ebx, [eax+4]	; second element to ebx
mov ecx, [ds:array]	; first element to ecx
mov edx, [ds:array+8]	; third element to edx

mov eax, 1
mov ebx, 0
int 80h
