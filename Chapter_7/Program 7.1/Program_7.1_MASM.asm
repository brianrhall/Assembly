; Program 7.1
; CMPS - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
src BYTE "Test sentence",0
lenSrc EQU ($ - src)
dst BYTE "Test sentence",0
lenDst EQU ($ - dst)

.code
_main PROC

; compare string lengths
mov eax, lenSrc
cmp eax, lenDst
jne notequal

; when lengths are equal execute CMPS
lea esi, src
lea edi, dst
mov ecx, lenSrc
cld
repe cmpsb

; after CMPS, see if it ended successfully
jnz notequal

; equality things
jmp done

notequal:
; non-equality things

done:
INVOKE ExitProcess, 0
_main ENDP
END
