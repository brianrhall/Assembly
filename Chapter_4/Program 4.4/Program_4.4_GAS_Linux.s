# Program 4.4
# Array - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
array: .long 1, 2, 3, 4

.text
.globl _main
_main:

# Load using byte offsets
leal array, %esi
movl (%esi), %eax
movl 4(%esi), %ebx

# Save using indices
movl $2, %edx
movl $10, (%esi, %edx, 4)
movl $3, %edx
movl $20, (%esi, %edx, 4)

movl $1, %eax
movl $0, %ebx
int $0x80
.end
