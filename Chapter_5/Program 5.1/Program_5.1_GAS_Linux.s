# Program 5.1
# Conditional Jump - GAS, Clang/LLVM on Linux (32-bit)
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
movl $1, %eax
movl $0, %ebx
int $0x80
.end
