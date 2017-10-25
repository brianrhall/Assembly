# Program C.1
# Template - GAS, Clang/LLVM on Linux (32-bit)
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

movl $1, %eax
movl $0, %ebx
int $0x80
.end
