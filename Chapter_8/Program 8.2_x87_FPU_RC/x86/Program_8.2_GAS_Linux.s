# Program 8.2
# x87 FPU Rounding Control - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
default_cw:  .word 0x0000
nearest:     .word 0x0000
down:        .word 0x0400
up:          .word 0x0800
zero:        .word 0x0C00

.bss
.lcomm result, 4

.text
.globl _main
_main:

finit                   # initialize FPU
fstcw default_cw        # store initialized control word in default
movw default_cw, %ax    # move default control word to AX register
andb $0b11110011, %ah   # clear RC field (bits 10 and 11)
orw %ax, nearest        # set RC bits to 00 and store in nearest
orw %ax, down           # set RC bits to 01 and store in down
orw %ax, up             # set RC bits to 10 and store in up
orw %ax, zero           # set RC bits to 11 and store in zero

xor %ax, %ax            # sequence to verify bits
movw default_cw, %ax
movw nearest, %ax
movw down, %ax
movw up, %ax
movw zero, %ax

fldcw nearest           # set desired rounding mode

fldpi                   # load pi on the stack
frndint                 # round to integer (uses rounding mode)
fists result            # store from FPU stack to memory
movl result, %eax       # mov rounded result to EAX

movl $1, %eax
movl $0, %ebx
int $0x80
.end
