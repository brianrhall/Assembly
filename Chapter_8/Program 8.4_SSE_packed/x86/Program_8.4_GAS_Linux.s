# Program 8.4
# SSE Packed Operations - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
.balign 16              # 16-byte alignment
vectorA: .float 1.2, 3.4, 5.6, 7.8
vectorB: .float 7.8, 5.6, 3.4, 1.2

.bss
.lcomm result, 128      # space for storing results

.text
.globl _main
_main:

movaps vectorA, %xmm0   # move aligned packed SP vectorA to XMM0
addps  vectorB, %xmm0   # add vectorB to XMM0
movaps %xmm0, result    # move data to result

movl $1, %eax
movl $0, %ebx
int $0x80
.end
