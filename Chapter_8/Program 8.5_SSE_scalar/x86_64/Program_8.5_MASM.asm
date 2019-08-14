; Program 8.5
; SSE Scalar Operations - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
ALIGN 16
valueA REAL4 1.2
pi     REAL8 3.14159265358979
result REAL4 ?			; space for storing result

.code
_main PROC			; scalar examples

movss  xmm0, valueA		; move valueA to XMM0
addss  xmm0, valueA		; add valueA to XMM0
movss  result, xmm0		; store result
mov    eax, result		; move result to EAX

movsd  xmm0, pi			; move pi to XMM0

xor rcx, rcx
call ExitProcess
_main ENDP

END
