# Program 4.3
# Negative Division - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.text
.globl _main
_main:

movl $-534, %eax
cdq
movl $15, %ebx
idivl %ebx

movl $1, %eax
movl $0, %ebx
int $0x80
.end
