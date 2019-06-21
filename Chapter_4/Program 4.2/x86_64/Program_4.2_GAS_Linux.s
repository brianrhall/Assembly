# Program 4.2
# Multiplication and Division - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
mval: .long 664751
dval: .long 8

.text
.global _main
_main:

# MUL 1-op
movl mval(%rip), %eax
movl $8, %ebx
mull %ebx

# IMUL 1-op
movl mval(%rip), %eax
movl $8, %ebx
imull %ebx

# IMUL 2-op
movl $8, %eax
imull mval(%rip), %eax

# IMUL 3-op
imull $8, mval(%rip), %eax

# DIV 1-op
movl $0, %edx
movl $5318008, %eax
movl dval(%rip), %ecx
divl %ecx

# IDIV 1-op
movl $0, %edx
movl $5318008, %eax
movl dval(%rip), %ecx
idivl %ecx

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
