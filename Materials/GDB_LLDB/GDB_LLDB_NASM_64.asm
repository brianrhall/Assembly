; GDB and LLDB
; Materials - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data
s1: DB "Hello Universe", 10, 0
lenS1: EQU ($ - s1)
nums: DD 2, 4, 6, 8, 10, 12
lenNums: EQU ($ - nums)
floats: DD 1.2, 3.4, 5.6, 7.8
lenFloats: DQ ($ - floats)
value: DD 22

SECTION .text
global _main
_main:

lea rax, s1
lea rax, nums
lea rax, floats
movups xmm0, [rel floats]

done:	
mov rax, 60
xor rdi, rdi
syscall
