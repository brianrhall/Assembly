# Program 10.2
# Debug and System Write Interrupts - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
output:    .ascii "Computer Architecture\n"
.equ len, (. - output)

.text
.globl _main
_main:              # Print "Computer Architecture"

#int $3             # Set breakpoint (remove if desired)
movl $1, %ebx       # File descriptor STDOUT (1)
movl $output, %ecx  # String address
movl $len, %edx     # String length
movl $4, %eax       # Use SYSCALL 4 (WRITE), prints to screen
int  $0x80          # system call interrupt

movl $1, %eax       # call number for exit
movl $0, %ebx       # return value
int $0x80           # system call interrupt

.end
