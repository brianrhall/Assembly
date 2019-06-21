# Program 3.2
# Working Example - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data                             # Section for variable definitions

decimalLiteral:    .byte 31       # Variable storing 31
hexLiteral:        .long 0xF      # Variable storing F (15 in decimal)
charLiteral:       .byte 'A'      # Variable storing 65 in decimal

# Variable containing a string that has a line break and is null-terminated
stringLiteral:     .ascii "This string has\na line break in it.\0"

# Variable that calculates the value of an expression to determine the
# length, in bytes, of the variable "stringLiteral" by subtracting the
# starting memory address of the variable from the current memory address
.equ lenString, (. - stringLiteral)

.bss                              # Section for uninitialized variables
.lcomm unInitVariable, 4          # Uninitialized, 4-byte variable

.text                             # Section for instructions
.globl _main                      # Make the label "_main"
                                  # available to the linker as an
                                  # entry point for the program
_main:                            # Label for program entry

# Label and instruction on
# the same line below
partOne: movl $10, %eax           # Assign 10 to the eax register
addl hexLiteral, %eax             # Add the value in hexLiteral to
                                  # the contents of the eax register
                                  # and store the result in eax

partTwo:                          # Label on its own line
inc %eax                          # Increment the value in eax

movl $1, %eax                     # Indicate exit system call code (1)
movl $0, %ebx                     # Return value of the program (0)
int $0x80                         # Issue the kernel interrupt
.end                              # End assembling
