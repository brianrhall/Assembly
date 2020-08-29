# Program 3.1
# Sample Assembly Program - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
sum: .long 0

.text
.global _main
_main:
movl $25, %eax
movl $50, %ebx
addl %ebx, %eax
movl %eax, sum(%rip)

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
