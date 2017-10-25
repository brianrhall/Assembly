# Chapter 1
# Assembly Bubble Sort - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
array: .long 3, 2, 6, 4, 1
count: .long 5

.text
.globl _main
_main:

mov count, %ecx
dec %ecx

outerLoop:
push %ecx
lea array, %esi

innerLoop:
mov (%esi), %eax
cmp %eax, 4(%esi)
jg nextStep
xchg 4(%esi), %eax
mov %eax, (%esi)

nextStep:
add $4, %esi
loop innerLoop
pop %ecx
loop outerLoop

movl $1, %eax
movl $0, %ebx
int $0x80
.end
