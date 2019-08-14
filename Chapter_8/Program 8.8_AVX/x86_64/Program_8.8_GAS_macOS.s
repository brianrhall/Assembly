# Program 8.8
# AVX - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
.balign 16
vectorA: .float 1.2, 3.4, 5.6, 7.8, 8.9, 9.0, 0.9, 9.8
vectorB: .float 7.8, 5.6, 3.4, 1.2, 0.1, 0.0, 8.1, -0.8
vectorC: .long 1, 1, 1, 1
vectorD: .long -2, -2, -2, -2

.text
.global _main
_main:                                  # AVX/AVX2 example

vmovaps  vectorA(%rip), %ymm0           # move vectorA to YMM0
vmovaps  vectorB(%rip), %ymm1           # move vectorA to YMM1
vaddps   %ymm0, %ymm1, %ymm2            # add vectorA and B, store in YMM2

vmovdqa  vectorC(%rip), %xmm3           # move vectorC to XMM3
vmovdqa  vectorC(%rip), %xmm4           # move vectorC to XMM4
vpsignd  vectorD(%rip), %xmm3, %xmm4    # negate sign of XMM3 values if vectorD
                                        #   values are < 0, store in XMM4
                                        # vpsign AVX support
                                        #   (CPUID for 128 or 256-bit capability)

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
