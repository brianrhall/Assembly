# Program 5.1
# Conditional Jump - GAS, Clang/LLVM (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
wages: .long 46000

.bss
.lcomm taxes, 4

.text
.globl _main
_main:

movl $50000, %eax
cmpl %eax, wages
jae high
movl $2000, taxes
jmp end

high:
movl $4000, taxes

end:
pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
