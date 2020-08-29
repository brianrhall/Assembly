# Program 5.1
# Conditional Jump - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2020 Hall & Slonka

.data
wages: .quad 46000

.bss
.lcomm taxes, 8

.text
.global _main
_main:

movq $50000, %rax
cmpq %rax, wages(%rip)
jae higher
movq $2000, taxes(%rip)
jmp done

higher:
movq $4000, taxes(%rip)

done:
movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
