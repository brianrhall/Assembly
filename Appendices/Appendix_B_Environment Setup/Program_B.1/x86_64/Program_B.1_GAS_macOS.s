# Program B.1
# Template - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

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

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
