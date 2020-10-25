# Program 8.1
# x87 FPU - GAS, g++, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2019 Hall & Slonka

.extern _printDouble

.data
value: .float 1.2

.bss
.lcomm r_value, 4   # Reserve 4 bytes for holding a 32-bit value
.lcomm f_result, 4
.lcomm d_result, 8  # Reserve 8 bytes for holding a 64-bit value

.text
.global _asmMain
_asmMain:
pushq %rbp
movq %rsp, %rbp

finit                       # initialize FPU
fldpi                       # load PI on FPU stack
flds value(%rip)            # load single precision value on FPU stack
fadd %st(1), %st            # st same as st(0), st(1) = PI, st(0) = 1.2
fists r_value(%rip)         # copies st(0), rounds to nearest, stores in memory, r_value = 4

fstps f_result(%rip)        # float store single precision (32 bits) from top of FPU stack
movss f_result(%rip), %xmm0
call _printFloat

fstpl d_result(%rip)        # float store double precision (64 bits) from top of FPU stack
movsd d_result(%rip), %xmm0
call _printDouble

popq %rbp
retq
.end
