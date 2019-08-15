# Program 10.1
# Using Segment Selectors - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
array: .long 3, 2, 6, 4, 1

.text
.global _main

_main:

leaq array(%rip), %rsi      # array address to rsi
movl 4(%rsi), %ebx          # second element to ebx
leaq %ds:array(%rip), %rdi  # array address to rdi
movl (%rdi), %ecx           # first element to ecx
movl 8(%rdi), %edx          # third element to edx

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
