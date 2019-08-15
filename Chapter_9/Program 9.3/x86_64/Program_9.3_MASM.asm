; Program 9.3
; Addition Macro - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

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

xor rcx, rcx
call ExitProcess
_main ENDP

END
