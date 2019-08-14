# Program 8.7
# SSE4 - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
.balign 16
vectorA: .float 1.2, 3.4, 5.6, 7.8
vectorB: .float 7.8, 5.6, 3.4, 1.2

.text
.globl _main
_main:

movaps  vectorA, %xmm0     # move aligned packed vectorA to XMM0
roundps $1, %xmm0, %xmm1   # round down(1) values in XMM0 and store in XMM1
cvtps2dq %xmm1, %xmm2      # convert SPF to int and store in XMM2

movaps  vectorB, %xmm3     # move aligned packed vectorB to XMM3
roundps $2, %xmm3, %xmm4   # round up(2) values in XMM3 and store in XMM4
cvtps2dq %xmm4, %xmm5      # convert SPF to int and store in XMM5

pmulld  %xmm2, %xmm5       # multiply doublewords and store in XMM5

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
