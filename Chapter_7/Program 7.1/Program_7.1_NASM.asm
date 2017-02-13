; Program 7.1
; CMPS - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
src: DB "Test sentence",0
lenSrc: EQU ($ - src)
dst: DB "Test sentence",0
lenDst: EQU ($ - dst)

SECTION .text
global _main
_main:

; compare string lengths
mov eax, lenSrc
cmp eax, lenDst
jne notequal

; when lengths are equal execute CMPS
lea esi, [src]
lea edi, [dst]
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
mov eax, 1
mov ebx, 0
int 80h
