; Program 5.2
; Looping - MASM (32-bit)
; Copyright (c) 2019 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
_main PROC

xor eax, eax
mov ecx, 5

myLoop:
  inc eax
  loop myLoop

INVOKE ExitProcess, 0
_main ENDP
END

