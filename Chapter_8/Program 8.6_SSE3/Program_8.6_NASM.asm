; Program 8.6
; SSE3 - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
align 16
vectorA: dd 1.2, 3.4, 5.6, 7.8
vectorB: dd 7.8, 5.6, 3.4, 1.2

section .text
global _main
_main:

movaps xmm0, [vectorA]	; move vectorA to XMM0
movaps xmm1, [vectorB]	; move vectorB to XMM1
haddps xmm0, xmm1	; horizontal add packed SP vectorB to vectorA

mov eax, 1
mov ebx, 0
int 80h
