# GDB and LLDB
# Materials - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
s1: .ascii "Hello Universe\n\0"
lenS1: .long (. - s1)
nums: .long 2, 4, 6, 8, 10, 12
lenNums: .long (. - nums)
floats: .float 1.2, 3.4, 5.6, 7.8
lenFloats: .long (. - floats)
value: .long 22

.text
.global _main
_main:

leaq s1(%rip), %rax
leaq nums(%rip), %rax
leaq floats(%rip), %rax
movups floats(%rip), %xmm0

done:
movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
