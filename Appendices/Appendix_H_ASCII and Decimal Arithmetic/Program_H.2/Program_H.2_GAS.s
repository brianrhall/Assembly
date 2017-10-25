# Program H.2
# Decimal Adjust after Addition - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
.text
.globl _main
_main:

xor %ax, %ax    # clear AX
xor %bx, %bx    # clear BX
mov $0x42, %al  # 42 decimal = 2A hex
add $0x68, %al  # 68 decimal = 44 hex
daa             # 110 decimal = 6E hex
                # CF = 1, AL = 10
adc $0, %bx     # BX = 0 + BX(0) + CF
cmp $0, %bx     # if CF set(1)
jz done
carry:
add $1, %ah     # set next byte to 1

done:
pushl $0
subl $4, %esp
movl $1, %eax
int $0x80

.end
