# Program 5.1
# Conditional Jump - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
wages: .long 46000

.bss
.lcomm taxes, 4

.text
.globl _main
_main:

movl $50000, %eax
cmpl %eax, wages
jae higher
movl $2000, taxes
jmp done

higher:
movl $4000, taxes

done:
pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
