# Program 4.1
# Addition and Subtraction - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2020 Hall & Slonka

.data
sum: .quad 0
val: .quad 25

.text
.global _main
_main:

mov $0, %rax
inc %rax
add $200, %rax
sub val(%rip), %rax
mov %rax, sum(%rip)
dec sum(%rip)
neg sum(%rip)

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
