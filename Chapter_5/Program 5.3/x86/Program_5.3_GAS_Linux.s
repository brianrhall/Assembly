# Program 5.3
# Nested for Loop - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2019 Hall & Slonka

.text
.globl _main
_main:

xorl %eax, %eax
movl $2, %ebx
outer:
    movl $3, %ecx
    inner:
        incl %eax
        decl %ecx
        cmpl $0, %ecx
        jne inner
    decl %ebx
    cmpl $0, %ebx
    jne outer

movl $1, %eax
movl $0, %ebx
int $0x80
.end
