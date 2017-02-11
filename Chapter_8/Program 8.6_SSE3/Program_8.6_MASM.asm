; Program 8.6
; SSE3 - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.686
.XMM.MODEL FLAT, C
.STACK 4096

ExitProcess PROTO stdcall, 
dwExitCode:DWORD

.data
ALIGN 16
vectorA REAL4 1.2, 3.4, 5.6, 7.8
vectorB REAL4 7.8, 5.6, 3.4, 1.2

.code
_main PROC

movaps xmm0, vectorA	; move vectorA to XMM0
movaps xmm1, vectorB	; move vectorB to XMM1
haddps xmm0, xmm1	; horizontal add packed SP vectorB to vectorA

INVOKE ExitProcess, 0
_main ENDP
END
