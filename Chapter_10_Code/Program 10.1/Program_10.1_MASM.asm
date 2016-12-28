; Program 10.1
; Using Segment Selectors - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD

.DATA
array DWORD 3, 2, 6, 4, 1

.CODE
_main PROC

mov eax, OFFSET array	; array address to eax
mov ebx, [eax+4]	; second element to ebx
mov ecx, ds:[array]	; first element to ecx
mov edx, ds:[array+8]	; third element to edx

INVOKE ExitProcess, 0
_main ENDP
END
