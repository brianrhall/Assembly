# Program 8.5
# SSE Scalar Operations - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
.balign 16
valueA: .float 1.2
pi: .double 3.14159265358979

.bss
.lcomm result, 4            # space for storing result

.text
.global _main
_main:                      # scalar examples

movss  valueA(%rip), %xmm0  # move valueA to XMM0
addss  valueA(%rip), %xmm0  # add valueA to XMM0
movss  %xmm0, result(%rip)  # store result
movl   result(%rip), %eax   # move result to EAX

movsd  pi(%rip), %xmm0      # move pi to XMM0

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
