; Program 8.8
; AVX - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.686
.XMM
.MODEL FLAT, C
.STACK 4096

ExitProcess PROTO stdcall, dwExitCode:DWORD

.data
vectorA REAL4 1.2, 3.4, 5.6, 7.8, 8.9, 9.0, 0.9, 9.8
vectorB REAL4 7.8, 5.6, 3.4, 1.2, 0.1, 0.0, 8.1, -0.8
vectorC DWORD 1, 1, 1, 1
vectorD DWORD -2, -2, -2, -2

.code
_main PROC				; AVX/AVX2 example

lea eax, vectorA
lea ebx, vectorB
vmovups  ymm0, YMMWORD PTR [eax]	; move vectorA to YMM0
vmovups  ymm1, YMMWORD PTR [ebx]	; move vectorA to YMM1
vaddps   ymm2, ymm1, ymm0		; add vectorA and B, store in YMM2

lea eax, vectorC
lea ebx, vectorD
vmovdqa  xmm3, XMMWORD PTR [eax]	; move vectorC to XMM3
vmovdqa  xmm4, XMMWORD PTR [ebx]	; move vectorC to XMM4
vpsignd  xmm4, xmm3, vectorD		; negate sign of XMM3 values if vectorD
					;   values are < 0, store in XMM4
					; vpsign AVX support
					;   (CPUID for 128 or 256-bit capability)

INVOKE ExitProcess, 0
_main ENDP
END
