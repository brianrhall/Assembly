; Program 5.4
; while Loop - MASM (32-bit)
; Copyright (c) 2019 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
_main PROC

mov eax, 30
while_loop:
   cmp eax, 50
   jae done
   inc eax
   jmp while_loop
done:

INVOKE ExitProcess, 0
_main ENDP
END
