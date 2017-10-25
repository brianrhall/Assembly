# Assignment 3.3
# Syntax Translation - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data

.bss
.lcomm letter, 1
.lcomm r, 4
.lcomm s, 4
.lcomm t, 4
.lcomm x, 2
.lcomm y, 2
.lcomm z, 2

.text
.globl _main
_main:

movb $0x77, letter
movl $0x5, r
movl $0x2, s
movw $0xa, x
movw $0x4, y

movw x, %ax
addw y, %ax
movw %ax, z

movw x, %ax
subw y, %ax
movw %ax, z

movl $0x0, %edx
movl r, %eax
movl s, %ecx
divl %ecx
movl %eax, t

movl $0x0, %edx
movl r, %eax
movl s, %ecx
divl %ecx
movl %edx, t

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80

.end
