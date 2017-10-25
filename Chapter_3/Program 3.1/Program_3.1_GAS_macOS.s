# Program 3.1
# Sample Assembly Program - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
sum: .long 0

.text
.globl _main
_main:
movl $25, %eax
movl $50, %ebx
addl %ebx, %eax
movl %eax, sum

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
