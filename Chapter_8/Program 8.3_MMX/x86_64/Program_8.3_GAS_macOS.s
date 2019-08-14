# Program 8.3
# MMX - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
w1: .word 1, 2, 3, 4
w5: .word 5, 6, 7, 8
result: .quad 0

.text
.global _main
_main:

movq w1(%rip), %mm0     # move quadword w1-w4 to MM0
movq w5(%rip), %mm1     # move quadword w5-w8 to MM1

paddsw %mm1, %mm0       # add packed signed words
movq %mm0, result(%rip) # move data to result

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
