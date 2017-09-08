; GDB and LLDB
; Materials - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

SECTION .data
s1: DB "Hello Universe", 10, 0
lenS1: EQU ($ - s1)
nums: DD 2, 4, 6, 8, 10, 12
lenNums: EQU ($ - nums)
floats: DD 1.2, 3.4, 5.6, 7.8
lenFloats: EQU ($ - floats)
value: DD 22

SECTION .text
global _main
_main:

mov eax, s1
mov eax, nums
mov eax, floats
movups xmm0, [floats]

done:	
mov eax, 1
mov ebx, 0
int 80h
