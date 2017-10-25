# Console Output
# Materials - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

# Uses system call information from Chapter 10

.data
s1: .ascii "Hello Universe\n\0"
lenS1: .long (. - s1)

.text
.globl _main
_main:

print:
pushl lenS1     # len of string
pushl $s1       # starting address of string
pushl $1        # stdout
pushl $0        # stack alignment
movl $4, %eax   # syswrite
int $0x80
addl $16, %esp

done:
pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
