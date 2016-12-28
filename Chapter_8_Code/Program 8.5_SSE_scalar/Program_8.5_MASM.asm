; Program 8.5
; SSE Scalar Operations - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.686
.XMM
.MODEL FLAT, C
.STACK 4096

ExitProcess PROTO stdcall, dwExitCode:DWORD

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

INVOKE ExitProcess, 0
_main ENDP
END
