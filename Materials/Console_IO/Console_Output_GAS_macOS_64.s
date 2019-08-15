# Console Output
# Materials - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

# Uses system call information from Chapter 10

.data
s1: .ascii "Hello Universe\n\0"
lenS1: .long (. - s1)

.text
.global _main
_main:

print:
    movq $0x2000004, %rax   # system write (4)
    movq $1, %rdi           # file handle STDOUT (1)
    leaq s1(%rip), %rsi     # address
    movq lenS1(%rip), %rdx  # length
    syscall

done:
    movq $0x2000001, %rax
    xorq %rdi, %rdi
    syscall
.end
