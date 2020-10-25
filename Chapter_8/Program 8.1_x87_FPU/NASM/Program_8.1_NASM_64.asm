; Program 8.1
; x87 FPU - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extern _printFloat
extern _printDouble

section .data
value: dd 1.2

section .bss
r_value: resd 1		; Reserve 4 bytes for holding a 32-bit value
f_result: resd 1
d_result: resq 1	; Reserve 8 bytes for holding a 64-bit value

section .text
global _asmMain
_asmMain:
push rbp
mov rbp, rsp

finit				; initialize FPU
fldpi				; load PI on FPU stack
fld DWORD [rel value]		; load single precision value on FPU stack
fadd ST0, ST1			; ST1 = PI, ST0 = 1.2
fist DWORD [rel r_value]	; copies ST0, rounds to nearest, stores in memory, r_value = 4

fstp DWORD [rel f_result]	; float store single precision (32 bits) from top of FPU stack
movss xmm0, DWORD [rel f_result]
call _printFloat

fstp QWORD [d_result]		; float store double precision (64 bits) from top of FPU stack
movsd xmm0, QWORD [rel d_result]
call _printDouble

pop rbp
ret
