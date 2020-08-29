; Program 5.2
; Looping - NASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .text
global _main
_main:

xor rax, rax
mov rcx, 5

myLoop:
  inc rax
  loop myLoop

mov rax, 60
xor rdi, rdi
syscall
