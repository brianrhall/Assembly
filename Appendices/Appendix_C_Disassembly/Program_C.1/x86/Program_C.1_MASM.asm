; Program C.1
; Template - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD

.DATA
num DWORD 80
sum DWORD ?

.CODE
_main PROC
mov eax, num
add eax, 20
mov sum, eax

INVOKE ExitProcess, 0
_main ENDP
END
