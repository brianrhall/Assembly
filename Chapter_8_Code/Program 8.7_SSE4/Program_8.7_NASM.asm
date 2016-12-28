; Program 8.7
; SSE4 - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
align 16
vectorA: dd 1.2, 3.4, 5.6, 7.8
vectorB: dd 7.8, 5.6, 3.4, 1.2

section .text
global _main
_main:

movaps  xmm0, [vectorA]	; move aligned packed vectorA to XMM0
roundps xmm1, xmm0, 1	; round down(1) values in XMM0 and store in XMM1
cvtps2dq xmm2, xmm1	; convert SPF to int and store in XMM2

movaps  xmm3, [vectorB]	; move aligned packed vectorB to XMM3
roundps xmm4, xmm3, 2	; round up(2) values in XMM3 and store in XMM4
cvtps2dq xmm5, xmm4	; convert SPF to int and store in XMM5

pmulld  xmm5, xmm2	; multiply doublewords and store in XMM5

mov eax, 1
mov ebx, 0
int 80h
