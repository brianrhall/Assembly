# Program 9.3
# Addition Macro - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.macro intAdd dest, source1, source2
    movl \source1, %eax
    addl \source2, %eax
    movl %eax, \dest
.endm

.data
intA: .long 2
intB: .long 4
intC: .long 3
intD: .long 7
result: .long 0

.text
.globl _main
_main:

    intAdd result, intA, intB
    intAdd result, intC, intD

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
