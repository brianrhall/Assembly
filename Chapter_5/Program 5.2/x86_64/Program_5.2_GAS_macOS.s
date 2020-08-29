# Program 5.2
# Looping - GAS, Clang/LLVM on macOS (64-bit)
# Copyright (c) 2020 Hall & Slonka

.text
.global _main
_main:

xor %rax, %rax
mov $5, %rcx

myLoop:
   inc %rax
   loop myLoop

mov $0x2000001, %rax
xor %rdi, %rdi
syscall
.end
