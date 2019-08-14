# Program 8.4
# SSE Packed Operations - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
.balign 16                      # 16-byte alignment
vectorA: .float 1.2, 3.4, 5.6, 7.8
vectorB: .float 7.8, 5.6, 3.4, 1.2

.bss
.lcomm result, 128              # space for storing results

.text
.global _main
_main:

movaps vectorA(%rip), %xmm0     # move aligned packed SP vectorA to XMM0
addps  vectorB(%rip), %xmm0     # add vectorB to XMM0
movaps %xmm0, result(%rip)      # move data to result

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
