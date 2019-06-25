; Program 5.3
; Nested for Loop - MASM (32-bit)
; Copyright (c) 2019 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
_main PROC

xor eax, eax
mov ebx, 2
outer:
   mov ecx, 3
      inner:
      inc eax
      dec ecx
      cmp ecx, 0
      jne inner
   dec ebx
   cmp ebx, 0
   jne outer

INVOKE ExitProcess, 0
_main ENDP
END
