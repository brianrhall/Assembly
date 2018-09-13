# Program C.1
# Template - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2018 Hall & Slonka

.data
num: .quad 80

.bss
.lcomm sum, 8

.text
.global _main

_main:
movq num(%rip), %rax
addq $20, %rax
movq %rax, sum(%rip)

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
