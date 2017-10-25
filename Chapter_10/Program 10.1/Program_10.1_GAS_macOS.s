# Program 10.1
# Using Segment Selectors - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
array: .long 3, 2, 6, 4, 1

.text
.globl _main

_main:

movl $array, %eax        # array address to eax
movl 4(%eax), %ebx       # second element to ebx
movl %ds:array, %ecx     # first element to ecx
movl %ds:array+8, %edx   # third element to edx

movl %gs, %esi           # gs to esi
movl $42, %gs:(%esi)     # 42 to gs:(offset in esi)
movl %gs:(%esi), %edi    # gs:offset to edi
movl $43, %gs:0x04       # 43 to gs:offset
movl %gs:0x04, %edi      # gs:offset to edi

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
