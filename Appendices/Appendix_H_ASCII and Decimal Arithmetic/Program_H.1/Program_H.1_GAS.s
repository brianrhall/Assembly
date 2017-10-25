# Program H.1
# ASCII Adjust after Addition - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
num1: .byte '8'
num2: .byte '2'

.text
.globl _main
_main:

xorw %ax, %ax     # must clear so it doesn’t influence the adjust
movb num1, %al
addb num2, %al
aaa               # ascii adjust
orw $0x3030, %ax  # convert to ascii

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80

.end
