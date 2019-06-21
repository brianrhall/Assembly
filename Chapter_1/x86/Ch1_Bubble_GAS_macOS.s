# Chapter 1
# Assembly Bubble Sort - GAS, Clang/LLVM on macOS (32-bit)
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

push $0
sub $4, %esp
mov $1, %eax
int $0x80
.end
