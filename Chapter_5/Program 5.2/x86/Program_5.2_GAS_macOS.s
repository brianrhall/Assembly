# Program 5.2
# Looping - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2019 Hall & Slonka

.text
.globl _main
_main:

xorl %eax, %eax
movl $5, %ecx

myLoop:
   incl %eax
   loop myLoop

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
