; Program 7.1
; CMPS - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data
src: DB "Test sentence",0
lenSrc: EQU ($ - src)
dst: DB "Test sentence",0
lenDst: EQU ($ - dst)

SECTION .text
global _main
_main:

; compare string lengths
mov rax, lenSrc
cmp rax, lenDst
jne notequal

; when lengths are equal execute CMPS
lea rsi, [rel src]
lea rdi, [rel dst]
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
mov rax, 60
xor rdi, rdi
syscall
