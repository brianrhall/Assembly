# Program 4.3
# Negative Division - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.text
.global _main
_main:

mov $-534, %rax
cqo
mov $15, %rbx
idiv %rbx

mov $0x2000001, %rax
xor %rdi, %rdi
syscall
.end
