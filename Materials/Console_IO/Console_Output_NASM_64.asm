; Console Output
; Materials - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

; Uses system call information from Chapter 10

SECTION .data
s1: DB "Hello Universe", 10, 0
lenS1: DQ ($ - s1)

SECTION .text
global _main
_main:

print:  mov rax, 1		; system write (1)
	mov rdi, 1		; file handle STDOUT (1)
	lea rsi, [rel s1]	; address
	mov rdx, [lenS1]	; length
	syscall

done:	
mov rax, 60
xor rdi, rdi
syscall
