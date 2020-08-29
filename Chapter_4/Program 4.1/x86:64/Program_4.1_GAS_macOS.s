# Program 4.1
# Addition and Subtraction - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
sum: .long 0
val: .long 25

.text
.global _main
_main:

movl $0, %eax
incl %eax
addl $200, %eax
subl val(%rip), %eax
movl %eax, sum(%rip)
decl sum(%rip)
negl sum(%rip)

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
