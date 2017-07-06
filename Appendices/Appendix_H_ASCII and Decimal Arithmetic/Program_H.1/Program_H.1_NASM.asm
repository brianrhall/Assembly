; Program H.1
; ASCII Adjust after Addition - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
num1: DB '8'
num2: DB '2'

SECTION .text
global _main
_main:

xor ax, ax      ; must clear so it doesn’t influence the adjust
mov al, [num1]
add al, [num2]
aaa             ; ascii adjust
or ax, 3030h    ; convert to ascii

mov eax, 1
mov ebx, 0
int 80h
