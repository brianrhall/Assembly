; Program 9.3
; Addition Macro - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD

intAdd MACRO dest, source1, source2
	mov eax, source1
	add eax, source2
	mov dest, eax
ENDM

.DATA
intA DWORD 2
intB DWORD 4
intC DWORD 3
intD DWORD 7
result DWORD 0

.CODE
_main PROC

	intAdd result, intA, intB
	intAdd result, intC, intD

INVOKE ExitProcess, 0
_main ENDP
END
