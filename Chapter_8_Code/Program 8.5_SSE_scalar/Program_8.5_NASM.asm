; Program 8.5
; SSE Scalar Operations - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
align 16
valueA: dd 1.2
pi: dq 3.14159265358979

section .bss
result: resd 1			; space for storing result

section .text
global _main
_main:				; scalar examples

movss  xmm0, [valueA]		; move valueA to XMM0
addss  xmm0, [valueA]		; add valueA to XMM0
movss  [result], xmm0		; store result
mov    eax, DWORD [result]	; move result to EAX

movsd  xmm0, [pi]		; move pi to XMM0

mov eax, 1
mov ebx, 0
int 80h
