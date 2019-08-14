; Program 8.8
; AVX - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

section .data
align 16
vectorA: dd 1.2, 3.4, 5.6, 7.8, 8.9, 9.0, 0.9, 9.8
vectorB: dd 7.8, 5.6, 3.4, 1.2, 0.1, 0.0, 8.1, -0.8
vectorC: dd 1, 1, 1, 1
vectorD: dd -2, -2, -2, -2

section .text
global _main
_main:					; AVX/AVX2 example

vmovaps  ymm0, [rel vectorA]		; move vectorA to YMM0
vmovaps  ymm1, [rel vectorB]		; move vectorA to YMM1
vaddps   ymm2, ymm1, ymm0		; add vectorA and B, store in YMM2

vmovdqa  xmm3, [rel vectorC]		; move vectorC to XMM3
vmovdqa  xmm4, [rel vectorC]		; move vectorC to XMM4
vpsignd  xmm4, xmm3, [rel vectorD]	; negate sign of XMM3 values if vectorD
					;   values are < 0, store in XMM4
					; vpsign AVX support
					;   (CPUID for 128 or 256-bit capability)

mov rax, 60
xor rdi, rdi
syscall
