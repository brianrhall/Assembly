; Program 8.4
; SSE Packed Operations - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.686
.XMM
.MODEL FLAT, C
.STACK 4096

ExitProcess PROTO stdcall, dwExitCode:DWORD

.data
ALIGN 16			; 16-byte alignment
vectorA REAL4 1.2, 3.4, 5.6, 7.8
vectorB REAL4 7.8, 5.6, 3.4, 1.2
result  REAL4 ?, ?, ?, ?	; space for storing results

.code
_main PROC

movaps xmm0, vectorA		; move aligned packed SP vectorA to XMM0
addps  xmm0, vectorB		; add vectorB to XMM0
movaps result, xmm0		; move data to result

INVOKE ExitProcess, 0
_main ENDP
END
