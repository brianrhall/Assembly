; Program 8.1
; x87 FPU - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

_printFloat  PROTO
_printDouble PROTO

.data
value    REAL4 1.2
r_value  DWORD ?	; Reserve 4 bytes for holding a 32-bit value
f_result REAL4 ?
d_result REAL8 ?	; Reserve 8 bytes for holding a 64-bit value

.code
_asmMain PROC
push rbp
sub rsp, 20h
lea rbp, [rsp + 20h]

finit			; initialize FPU
fldpi			; load PI on FPU stack
fld value		; load single precision value on FPU stack
fadd ST(0), ST(1)	; ST(1) = PI, ST(0) = 1.2
fist r_value		; copies ST(0), rounds to nearest, stores in memory, r_value = 4

fstp f_result		; float store single precision (32 bits) from top of FPU stack
movss xmm0, f_result
call _printFloat

fstp d_result		; float store double precision (64 bits) from top of FPU stack
movsd xmm0, d_result
call _printDouble

lea rsp, [rbp]
pop rbp
ret
_asmMain ENDP
END
