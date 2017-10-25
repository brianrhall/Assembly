# Program 4.3
# Negative Division - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.text
.globl _main
_main:

movl $-534, %eax
cdq
movl $15, %ebx
idivl %ebx

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
