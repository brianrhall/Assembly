; Program 4.2
; Multiplication and Division - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
mval DWORD 664751
dval DWORD 8

.code
_main PROC

; MUL 1-op
mov eax, mval
mov ebx, 8
mul ebx

; IMUL 1-op
mov eax, mval
mov ebx, 8
imul ebx

; IMUL 2-op
mov eax, 8
imul eax, mval

; IMUL 3-op
imul eax, mval, 8

; DIV 1-op
mov edx, 0
mov eax, 5318008
mov ecx, dval
div ecx

; IDIV 1-op
mov edx, 0
mov eax, 5318008
mov ecx, dval
idiv ecx

INVOKE ExitProcess, 0
_main ENDP
END
