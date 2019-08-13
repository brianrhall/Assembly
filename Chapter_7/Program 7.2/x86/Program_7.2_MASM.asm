; Program 7.2
; SCAS - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
src BYTE "Test sentence",0
lenSrc EQU ($ - src)
search BYTE "s"

.code
_main PROC

xor eax, eax
mov al, search
lea edi, src
mov ecx, lenSrc
cld
repne scasb

; after SCAS, test for success
jnz notfound

; found things
jmp done

notfound:
; non-found things

done:
INVOKE ExitProcess, 0
_main ENDP
END
