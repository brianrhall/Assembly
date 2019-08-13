; Program 7.1
; CMPS - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
src BYTE "Test sentence",0
lenSrc EQU ($ - src)
dst BYTE "Test sentence",0
lenDst EQU ($ - dst)

.code
_main PROC

; compare string lengths
mov rax, lenSrc
cmp rax, lenDst
jne notequal

; when lengths are equal execute CMPS
lea rsi, src
lea rdi, dst
mov rcx, lenSrc
cld
repe cmpsb

; after CMPS, see if it ended successfully
jnz notequal

; equality things
jmp done

notequal:
; non-equality things

done:
xor rcx, rcx
call ExitProcess
_main ENDP

END
