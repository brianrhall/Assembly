# GDB and LLDB
# Materials - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
s1: .ascii "Hello Universe\n\0"
lenS1: .long (. - s1)
nums: .long 2, 4, 6, 8, 10, 12
lenNums: .long (. - nums)
floats: .float 1.2, 3.4, 5.6, 7.8
lenFloats: .long (. - floats)
value: .long 22

.text
.globl _main
_main:

movl $s1, %eax
movl $nums, %eax
movl $floats, %eax
movups floats, %xmm0

done:
pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
