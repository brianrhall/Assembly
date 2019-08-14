; Program 8.4
; SSE Packed Operations - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

section .data
align 16			; 16-byte alignment
vectorA: dd 1.2, 3.4, 5.6, 7.8
vectorB: dd 7.8, 5.6, 3.4, 1.2

section .bss
result: resd 4			; space for storing results

section .text
global _main
_main:

movaps xmm0, [rel vectorA]	; move aligned packed SP vectorA to XMM0
addps  xmm0, [rel vectorB]	; add vectorB to XMM0
movaps [rel result], xmm0	; move data to result

mov rax, 60
xor rdi, rdi
syscall
