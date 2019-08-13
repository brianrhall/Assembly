; Program 7.2
; SCAS - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
src: DB "Test sentence",0
lenSrc: EQU ($ - src)
search: DB "s"

SECTION .text
global _main
_main:

xor eax, eax
mov al, [search]
lea edi, [src]
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
mov eax, 1
mov ebx, 0
int 80h
