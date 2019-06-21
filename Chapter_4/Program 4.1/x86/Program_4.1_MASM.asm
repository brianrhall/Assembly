; Program 4.1
; Addition and Subtraction - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
sum DWORD 0
val DWORD 25

.code
_main PROC

mov eax, 0
inc eax
add eax, 200
sub eax, val
mov sum, eax
dec sum
neg sum

INVOKE ExitProcess, 0
_main ENDP
END
