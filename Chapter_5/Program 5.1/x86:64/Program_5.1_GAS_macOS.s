# Program 5.1
# Conditional Jump - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
wages: .long 46000

.bss
.lcomm taxes, 4

.text
.global _main
_main:

movl $50000, %eax
cmpl %eax, wages(%rip)
jae higher
movl $2000, taxes(%rip)
jmp done

higher:
movl $4000, taxes(%rip)

done:
movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
