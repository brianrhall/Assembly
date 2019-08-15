# Console Output
# Materials - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

# Uses system call information from Chapter 10

.data
s1: .ascii "Hello Universe\n\0"
lenS1: .long (. - s1)

.text
.globl _main
_main:

print:
    movl $4, %eax       # syswrite
    movl $1, %ebx       # stdout
    movl $s1, %ecx      # starting address of string
    movl lenS1, %edx    # len of string
    int $0x80

done:
movl $1, %eax
movl $0, %ebx
int $0x80
.end
