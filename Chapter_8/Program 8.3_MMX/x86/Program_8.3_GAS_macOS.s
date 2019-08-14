# Program 8.3
# MMX - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
w1: .word 1, 2, 3, 4
w5: .word 5, 6, 7, 8
result: .quad 0

.text
.globl _main
_main:

movq w1, %mm0        # move quadword w1-w4 to MM0
movq w5, %mm1        # move quadword w5-w8 to MM1

paddsw %mm1, %mm0    # add packed signed words
movq %mm0, result    # move data to result

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
