# Program 4.3
# Negative Division - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2020 Hall & Slonka

.text
.global _main
_main:

mov $-534, %rax
cqo
mov $15, %rbx
idiv %rbx

mov $60, %rax
xor %rdi, %rdi
syscall
.end
