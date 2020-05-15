# Program 8.2
# x87 FPU Rounding Control - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2019 Hall & Slonka

default_cw:  .word 0x0000
nearest:     .word 0x0000
down:        .word 0x0400
up:          .word 0x0800
zero:        .word 0x0C00

.bss
.lcomm result, 8

.text
.global _main
_main:

finit                           # initialize FPU
fstcw default_cw(%rip)          # store initialized control word in default
movw default_cw(%rip), %ax      # move default control word to AX register
andb $0b11110011, %ah           # clear RC field (bits 10 and 11)
orw %ax, nearest(%rip)          # set RC bits to 00 and store in nearest
orw %ax, down(%rip)             # set RC bits to 01 and store in down
orw %ax, up(%rip)               # set RC bits to 10 and store in up
orw %ax, zero(%rip)             # set RC bits to 11 and store in zero

xor %ax, %ax                    # sequence to verify bits
movw default_cw(%rip), %ax
movw nearest(%rip), %ax
movw down(%rip), %ax
movw up(%rip), %ax
movw zero(%rip), %ax

fldcw nearest(%rip)             # set desired rounding mode

fldpi                           # load pi on the stack
frndint                         # round to integer (uses rounding mode)
fistpq result(%rip)             # store from FPU stack to memory
movq result(%rip), %rax         # mov rounded result to RAX

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
