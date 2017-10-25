# Program 10.1
# Using Segment Selectors - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
array: .long 3, 2, 6, 4, 1

.text
.globl _main

_main:

movl $array, %eax        # array address to eax
movl 4(%eax), %ebx       # second element to ebx
movl %ds:array, %ecx     # first element to ecx
movl %ds:array+8, %edx   # third element to edx

movl $1, %eax
movl $0, %ebx
int $0x80
.end
