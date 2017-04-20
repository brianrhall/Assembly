; Program 10.6
; SYSCALL on Linux (NASM 64-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
output: DB "Computer Architecture",0Ah
len: DQ ($ - output)
file_name: DB "output.txt",0
file_handle: DD 0

section .text
global _main
_main:

mov rax, 1                  ; system write (1)
mov rdi, 1                  ; file handle STDOUT (1)
lea rsi, [rel output]       ; address
mov rdx, [len]              ; length
syscall

mov rax, 2                  ; system open (2)
lea rdi, [rel file_name]    ; path
mov rsi, 0101o              ; flags (01=O_CREAT, 01=O_WRONLY)
mov rdx, 0666o              ; mode (permissions)
syscall
mov [rel file_handle], rax

mov rax, 1                  ; system write (1)
mov rdi, [rel file_handle]  ; file handle
lea rsi, [rel output]       ; address
mov rdx, [len]              ; length
syscall

mov rax, 3                  ; system close (3)
mov rdi, [rel file_handle]  ; file handle
syscall

mov rax, 60                 ; system exit
xor rdi, rdi                ; return value
syscall
