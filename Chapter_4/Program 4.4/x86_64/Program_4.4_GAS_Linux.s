# Program 4.4
# Array - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2020 Hall & Slonka

.data
array: .quad 1, 2, 3, 4

.text
.global _main
_main:

# Load using byte offsets
leaq array(%rip), %rsi
movq (%rsi), %rax
movq 8(%rsi), %rbx

# Save using indices
movq $2, %rdx
movq $10, (%rsi, %rdx, 8)
movq $3, %rdx
movq $20, (%rsi, %rdx, 8)

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
