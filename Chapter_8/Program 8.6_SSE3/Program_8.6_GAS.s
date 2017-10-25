# Program 8.6
# SSE3 - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
.balign 16
vectorA: .float 1.2, 3.4, 5.6, 7.8
vectorB: .float 7.8, 5.6, 3.4, 1.2

.text
.globl _main
_main:

movaps vectorA, %xmm0   # move vectorA to XMM0
movaps vectorB, %xmm1   # move vectorB to XMM1
haddps %xmm1, %xmm0     # horizontal add packed SP vectorB to vectorA

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
