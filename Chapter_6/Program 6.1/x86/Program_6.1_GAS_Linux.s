# Program 6.1
# Sum Program - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
num1: .long 2
num2: .long 4

.text
.globl _main, _sum
_main:

mov $10, %eax
dec %eax
mov $5, %ebx

push num2
push num1
call _sum
add $8, %esp

add %ebx, %eax
dec %eax

movl $1, %eax
movl $0, %ebx
int $0x80

_sum:
push %ebp
mov %esp, %ebp
push %ebx

mov 8(%ebp), %ebx
mov 12(%ebp), %eax
add %ebx, %eax
pop %ebx
pop %ebp
ret

.end
