# Program 8.5
# SSE Scalar Operations - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
.balign 16
valueA: .float 1.2
pi: .double 3.14159265358979

.bss
.lcomm result, 4        # space for storing result

.text
.globl _main
_main:                  # scalar examples

movss  valueA, %xmm0    # move valueA to XMM0
addss  valueA, %xmm0    # add valueA to XMM0
movss  %xmm0, result    # store result
movl   result, %eax     # move result to EAX

movsd  pi, %xmm0        # move pi to XMM0

movl $1, %eax
movl $0, %ebx
int $0x80
.end
