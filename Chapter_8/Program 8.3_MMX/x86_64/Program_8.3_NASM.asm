; Program 8.3
; MMX - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

section .data
w1: dw 1, 2, 3, 4
w5: dw 5, 6, 7, 8
result: dq 0

section .text
global _main
_main:

movq mm0, [rel w1]	; move quadword w1-w4 to MM0
movq mm1, [rel w5]	; move quadword w5-w8 to MM1

paddsw mm0, mm1		; add packed signed words
movq [rel result], mm0	; move data to result

mov rax, 60
xor rdi, rdi
syscall
