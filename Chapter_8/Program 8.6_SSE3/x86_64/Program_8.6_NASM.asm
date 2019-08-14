; Program 8.6
; SSE3 - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

section .data
align 16
vectorA: dd 1.2, 3.4, 5.6, 7.8
vectorB: dd 7.8, 5.6, 3.4, 1.2

section .text
global _main
_main:

movaps xmm0, [rel vectorA]	; move vectorA to XMM0
movaps xmm1, [rel vectorB]	; move vectorB to XMM1
haddps xmm0, xmm1		; horizontal add packed SP vectorB to vectorA

mov rax, 60
xor rdi, rdi
syscall
