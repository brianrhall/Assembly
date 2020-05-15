# Program 5.3
# Nested for Loop - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2017 Hall & Slonka

.text
.global _main
_main:

xorq %rax, %rax
movq $2, %rbx
outer:
    movq $3, %rcx
    inner:
        incq %rax
        decq %rcx
        cmpq $0, %rcx
        jne inner
    decq %rbx
    cmpq $0, %rbx
    jne outer

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
