; Program 5.3
; Nested for Loop - NASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .text
global _main
_main:

xor rax, rax
mov rbx, 2
outer:
   mov rcx, 3
      inner:
      inc rax
      dec rcx
      cmp rcx, 0
      jne inner
   dec rbx
   cmp rbx, 0
   jne outer

mov rax, 60
xor rdi, rdi
syscall
