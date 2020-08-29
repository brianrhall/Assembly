# Program 3.1
# Sample Assembly Program - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2020 Hall & Slonka

.data
sum: .quad 0

.text
.global _main
_main:
mov $25, %rax
mov $50, %rbx
add %rbx, %rax
mov %rax, sum(%rip)

mov $0x2000001, %rax
xor %rdi, %rdi
syscall
.end
