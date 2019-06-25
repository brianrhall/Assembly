# Program 5.2
# Looping - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2019 Hall & Slonka

.text
.globl _main
_main:

xorl %eax, %eax
movl $5, %ecx

myLoop:
   incl %eax
   loop myLoop

movl $1, %eax
movl $0, %ebx
int $0x80
.end
