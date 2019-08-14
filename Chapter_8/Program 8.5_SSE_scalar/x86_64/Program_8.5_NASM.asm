; Program 8.5
; SSE Scalar Operations - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

section .data
align 16
valueA: dd 1.2
pi: dq 3.14159265358979

section .bss
result: resd 1			; space for storing result

section .text
global _main
_main:				; scalar examples

movss  xmm0, [rel valueA]	; move valueA to XMM0
addss  xmm0, [rel valueA]	; add valueA to XMM0
movss  [rel result], xmm0	; store result
mov    eax, DWORD [rel result]	; move result to EAX

movsd  xmm0, [rel pi]		; move pi to XMM0

mov rax, 60
xor rdi, rdi
syscall
