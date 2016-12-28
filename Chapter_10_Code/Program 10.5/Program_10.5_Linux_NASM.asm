; Program 10.5
; SYSENTER - Linux (NASM 32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
output: DB "Computer Architecture",0Ah
len: EQU ($ - output)

section .text
global _main
_main:        

mov ebx, 1    
mov ecx, output 
mov edx, len	
mov eax, 4      

push sysenter_ret
push  ecx
push  edx
push  ebp
mov   ebp, esp
sysenter
sysenter_ret:

mov eax, 1
mov ebx, 0
int 80h
