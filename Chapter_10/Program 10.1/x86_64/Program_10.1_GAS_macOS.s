# Program 10.1
# Using Segment Selectors - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
array: .long 3, 2, 6, 4, 1

.text
.global _main

_main:

leaq array(%rip), %rsi      # array address to rsi
movl 4(%rsi), %ebx          # second element to ebx
leaq %ds:array(%rip), %rdi  # array address to rdi
movl (%rdi), %ecx           # first element to ecx
movl 8(%rdi), %edx          # third element to edx

movq %gs, %rsi              # gs to rsi
movq $42, %gs:(%rsi)        # 42 to gs:(offset in rsi)
movq %gs:(%rsi), %rdi       # gs:offset to rdi
movq $43, %gs:0x04          # 43 to gs:offset
movq %gs:0x04, %rdi         # gs:offset to rdi

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
