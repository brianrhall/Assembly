; Program H.2
; Decimal Adjust after Addition - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
SECTION .text
global _main
_main:

xor ax, ax    ; clear AX
xor bx, bx    ; clear BX
mov al, 42h   ; 42 decimal = 2A hex
add al, 68h   ; 68 decimal = 44 hex
daa           ; 110 decimal = 6E hex
              ; CF = 1, AL = 10
adc bx, 0     ; BX = 0 + BX(0) + CF
cmp bx, 0     ; if CF set(1)
jz done
carry:
add ah, 1     ; set next byte to 1

done:
mov eax, 1
mov ebx, 0
int 80h
