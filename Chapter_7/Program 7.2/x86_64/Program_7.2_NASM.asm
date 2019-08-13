; Program 7.2
; SCAS - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data
src: DB "Test sentence",0
lenSrc: EQU ($ - src)
search: DB "s"

SECTION .text
global _main
_main:

xor rax, rax
mov al, [rel search]
lea rdi, [rel src]
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
mov rax, 60
xor rdi, rdi
syscall
