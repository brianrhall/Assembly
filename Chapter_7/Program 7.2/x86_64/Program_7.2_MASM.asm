; Program 7.2
; SCAS - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
src BYTE "Test sentence",0
lenSrc EQU ($ - src)
search BYTE "s"

.code
_main PROC

xor rax, rax
mov al, search
lea rdi, src
mov rcx, lenSrc
cld
repne scasb

; after SCAS, test for success
jnz notfound

; found things
jmp done

notfound:
; non-found things

done:
xor rcx, rcx
call ExitProcess
_main ENDP

END
