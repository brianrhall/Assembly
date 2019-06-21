# Program 4.1
# Addition and Subtraction - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
sum: .long 0
val: .long 25

.text
.globl _main
_main:

movl $0, %eax
incl %eax
addl $200, %eax
subl val, %eax
movl %eax, sum
decl sum
negl sum

movl $1, %eax
movl $0, %ebx
int $0x80
.end
