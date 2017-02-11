; Program 4.3
; Negative Division - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
_main PROC

mov eax, -534
cdq
mov ebx, 15
idiv ebx

INVOKE ExitProcess, 0
_main ENDP
END
