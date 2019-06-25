# Program 5.4
# while Loop - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2019 Hall & Slonka

.text
.globl _main
_main:

movl $30, %eax
while_loop:
    cmpl $50, %eax
    jae done
    incl %eax
    jmp while_loop
done:

pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
