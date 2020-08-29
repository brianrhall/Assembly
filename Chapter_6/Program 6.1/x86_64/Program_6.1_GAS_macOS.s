# Program 6.1
# Sum Program - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2020 Hall & Slonka

.data
num1: .long 2
num2: .long 4

.text
.global _main, _sum
_main:

movq $10, %rax
decq %rax
movq $5, %rbx

movslq num1(%rip), %rdi
movslq num2(%rip), %rsi
callq _sum

addq %rbx, %rax
decq %rax

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall

_sum:
pushq %rbp
movq %rsp, %rbp
pushq %rbx
movq %rdi, %rax
addq %rsi, %rax
popq %rbx
popq %rbp
retq

.end
