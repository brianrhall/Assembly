; Program 10.2
; Debug and System Write Interrupts - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
output: DB "Computer Architecture",0Ah
len: EQU ($ - output)

section .text
global _main
_main:          ; Print "Computer Architecture"

;int 3h         ; Set breakpoint (remove if desired)
mov ebx, 1      ; File descriptor STDOUT (1)
mov ecx, output ; String address
mov edx, len	; String length
mov eax, 4      ; Use SYSCALL 4 (WRITE), prints to screen
int 80h         ; system call interrupt

mov eax, 1	; call number for exit
mov ebx, 0	; return value
int 80h		; system call interrupt
