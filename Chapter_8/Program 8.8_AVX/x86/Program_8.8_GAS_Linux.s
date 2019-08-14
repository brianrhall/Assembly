# Program 8.8
# AVX - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
.balign 16
vectorA: .float 1.2, 3.4, 5.6, 7.8, 8.9, 9.0, 0.9, 9.8
vectorB: .float 7.8, 5.6, 3.4, 1.2, 0.1, 0.0, 8.1, -0.8
vectorC: .long 1, 1, 1, 1
vectorD: .long -2, -2, -2, -2

.text
.globl _main
_main:                          # AVX/AVX2 example

vmovaps  vectorA, %ymm0         # move vectorA to YMM0
vmovaps  vectorB, %ymm1         # move vectorA to YMM1
vaddps   %ymm0, %ymm1, %ymm2    # add vectorA and B, store in YMM2

vmovdqa  vectorC, %xmm3         # move vectorC to XMM3
vmovdqa  vectorC, %xmm4         # move vectorC to XMM4
vpsignd  vectorD, %xmm3, %xmm4  # negate sign of XMM3 values if vectorD
                                #   values are < 0, store in XMM4
                                # vpsign AVX support
                                #   (CPUID for 128 or 256-bit capability)

movl $1, %eax
movl $0, %ebx
int $0x80
.end
