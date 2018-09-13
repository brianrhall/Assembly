# Program B.1
# Template - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
num: .long 80

.bss
.lcomm sum, 4

.text
.globl _main

_main:
movl num, %eax
addl $20, %eax
movl %eax, sum

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
