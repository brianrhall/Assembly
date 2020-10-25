; Program 8.1
; x87 FPU - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.686
.MODEL FLAT, C
.STACK 4096

_printFloat  PROTO C
_printDouble PROTO C

.data
value    REAL4 1.2
r_value  DWORD ?	; Reserve 4 bytes for holding a 32-bit value
f_result REAL4 ?
d_result REAL8 ?	; Reserve 8 bytes for holding a 64-bit value

.code
_asmMain PROC
push ebp
mov ebp, esp

finit			; initialize FPU
fldpi			; load PI on FPU stack
fld value		; load single precision value on FPU stack
fadd ST(0), ST(1)	; ST(1) = PI, ST(0) = 1.2
fist r_value		; copies ST(0), rounds to nearest, stores in memory, r_value = 4

fstp f_result		; float store single precision (32 bits) from top of FPU stack
push f_result
call _printFloat
add esp, 4

fstp d_result		; float store double precision (64 bits) from top of FPU stack
push DWORD PTR [d_result + 4]
push DWORD PTR [d_result]
call _printDouble
add esp, 8

pop ebp
ret
_asmMain ENDP
END
