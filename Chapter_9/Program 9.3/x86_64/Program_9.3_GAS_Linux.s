# Program 9.3
# Addition Macro - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2019 Hall & Slonka

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
.global _main
_main:

    intAdd result(%rip), intA(%rip), intB(%rip)
    intAdd result(%rip), intC(%rip), intD(%rip)

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
