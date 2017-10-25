# Program 4.1
# Addition and Subtraction - GAS, Clang/LLVM on macOS (32-bit)
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

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
