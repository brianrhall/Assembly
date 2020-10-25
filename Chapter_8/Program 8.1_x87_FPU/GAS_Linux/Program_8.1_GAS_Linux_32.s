# Program 8.1
# x87 FPU - GAS, g++, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.extern _printFloat
.extern _printDouble

.data
value: .float 1.2

.bss
.lcomm r_value, 4   # Reserve 4 bytes for holding a 32-bit value
.lcomm f_result, 4
.lcomm d_result, 8  # Reserve 8 bytes for holding a 64-bit value

.text
.globl _asmMain
_asmMain:
push %ebp
movl %esp, %ebp

finit               # initialize FPU
fldpi               # load PI on FPU stack
flds value          # load single precision value on FPU stack
fadd %st(1), %st    # st same as st(0), st(1) = PI, st(0) = 1.2
fists r_value       # copies st(0), rounds to nearest, stores in memory, r_value = 4

fstps f_result      # float store single precision (32 bits) from top of FPU stack
push f_result
call _printFloat
add $4, %esp

fstpl d_result      # float store double precision (64 bits) from top of FPU stack
push d_result + 4
push d_result
call _printDouble
add $8, %esp

pop %ebp
ret
.end
