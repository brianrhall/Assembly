# Program 10.2
# Debug and System Write Interrupts - GAS, Clang/LLVM on macOS (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
output:    .ascii "Computer Architecture\n"
.equ len, (. - output)

.text
.globl _main
_main:           # Print "Computer Architecture"

int $3           # Set breakpoint (remove if desired)
pushl $len       # String length
pushl $output    # String address
pushl $1         # Print to STDOUT (File Descriptor 1, FD1)
pushl $0         # Extra push to align stack
movl $4, %eax    # Use SYSCALL 4 (WRITE), prints to screen
int  $0x80       # system call interrupt
addl $16, %esp   # Clean up stack

pushl $len       # BSD assumes that a function calls INT 80h
pushl $output    # as opposed to issuing INT 80h directly
pushl $1         # Print using kernel call
movl $4, %eax
call _kernel
addl $12, %esp

pushl $0         # return value
subl $4, %esp    # align stack
movl $1, %eax    # call number for exit
int $0x80        # system call interrupt

_kernel:         # For any system call
   int $0x80
   ret

.end
