# Program 5.4
# while Loop - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2017 Hall & Slonka

.text
.global _main
_main:

movq $30, %rax
while_loop:
    cmpq $50, %rax
    jae done
    incq %rax
    jmp while_loop
done:

movq $0x2000001, %rax
xorq %rdi, %rdi
syscall
.end
