; Program 8.4
; SSE Packed Operations - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
align 16			; 16-byte alignment
vectorA: dd 1.2, 3.4, 5.6, 7.8
vectorB: dd 7.8, 5.6, 3.4, 1.2

section .bss
result: resd 4			; space for storing results

section .text
global _main
_main:

movaps xmm0, [vectorA]		; move aligned packed SP vectorA to XMM0
addps  xmm0, [vectorB]		; add vectorB to XMM0
movaps [result], xmm0		; move data to result

mov eax, 1
mov ebx, 0
int 80h
