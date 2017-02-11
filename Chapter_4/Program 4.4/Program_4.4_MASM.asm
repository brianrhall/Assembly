; Program 4.4
; Array - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array DWORD 1, 2, 3, 4

.code
_main PROC

; Load using byte offsets
mov eax, array
mov ebx, [array + 4]

; Save using indices
mov edx, 2
mov [array + edx * 4], 10
mov edx, 3
mov [array + edx * 4], 20

INVOKE ExitProcess, 0
_main ENDP
END
