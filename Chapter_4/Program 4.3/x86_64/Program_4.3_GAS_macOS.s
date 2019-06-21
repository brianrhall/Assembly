# Program 4.3
# Negative Division - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.text
.global _main
_main:

movl $-534, %eax
cdq
movl $15, %ebx
idivl %ebx

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
