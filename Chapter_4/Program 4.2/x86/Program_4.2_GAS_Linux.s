# Program 4.2
# Multiplication and Division - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
mval: .long 664751
dval: .long 8

.text
.globl _main
_main:

# MUL 1-op
movl mval, %eax
movl $8, %ebx
mull %ebx

# IMUL 1-op
movl mval, %eax
movl $8, %ebx
imull %ebx

# IMUL 2-op
movl $8, %eax
imull mval, %eax

# IMUL 3-op
imull $8, mval, %eax

# DIV 1-op
movl $0, %edx
movl $5318008, %eax
movl dval, %ecx
divl %ecx

# IDIV 1-op
movl $0, %edx
movl $5318008, %eax
movl dval, %ecx
idivl %ecx

movl $1, %eax
movl $0, %ebx
int $0x80
.end
