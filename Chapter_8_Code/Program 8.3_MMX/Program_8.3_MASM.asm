; Program 8.3
; MMX - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.686
.MMX
.MODEL FLAT, C
.STACK 4096

ExitProcess PROTO stdcall, dwExitCode:DWORD

.data
w1 WORD 1, 2, 3, 4
w5 WORD 5, 6, 7, 8
result QWORD 0

.code
_main PROC

lea eax, w1
lea ebx, w5
movq mm0, [eax]		; move quadword w1-w4 to MM0
movq mm1, [ebx]		; move quadword w5-w8 to MM1

paddsw mm0, mm1		; add packed signed words
movq result, mm0	; move data to result

INVOKE ExitProcess, 0
_main ENDP
END
