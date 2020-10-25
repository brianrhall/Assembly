; Program 8.1
; x87 FPU - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

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
push ebp
mov ebp, esp

finit			; initialize FPU
fldpi			; load PI on FPU stack
fld DWORD [value]	; load single precision value on FPU stack
fadd ST0, ST1		; ST1 = PI, ST0 = 1.2
fist DWORD [r_value]	; copies ST0, rounds to nearest, stores in memory, r_value = 4

fstp DWORD [f_result]	; float store single precision (32 bits) from top of FPU stack
push DWORD [f_result]
call _printFloat
add esp, 4

fstp QWORD [d_result]	; float store double precision (64 bits) from top of FPU stack
push DWORD [d_result + 4]
push DWORD [d_result]
call _printDouble
add esp, 8

pop ebp
ret
