# Program 4.4
# Array - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
array: .long 1, 2, 3, 4

.text
.global _main
_main:

# Load using byte offsets
leaq array(%rip), %rsi
movl (%rsi), %eax
movl 4(%rsi), %ebx

# Save using indices
movq $2, %rdx
movl $10, (%rsi, %rdx, 4)
movq $3, %rdx
movl $20, (%rsi, %rdx, 4)

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
