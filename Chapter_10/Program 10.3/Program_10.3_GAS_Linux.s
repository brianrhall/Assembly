# Program 10.3
# Print Process ID with INT - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
decimal: .long 10
.bss
.lcomm PID, 4    # Reserve 4 bytes for a process id

.text
.globl _main
_main:                      # Print Process ID

movl $0x14, %eax            # GET_PID call
int $0x80                   # syscall
                            # process ID is returned in EAX
movl $(PID+4), %edi         # Pointer to end of PID string
convert:
    xorl    %edx, %edx
    divl    decimal         # Divide by 10
    addl    $48, %edx       # Add 48 to remainder
    movb    %dl, (%edi)     # Store
    decl    %edi            # Next digit
    cmpl    $0, %eax        # Is EAX = 0?
    jg      convert         # If greater than 0, more digits

movl $1, %ebx               # File descriptor STDOUT (1)
movl $PID, %ecx             # String address
movl $6, %edx               # String length
movl $4, %eax               # system call 4 (WRITE), prints to screen
int $0x80                   # system call

movl $1, %eax               # system call 1 (exit)
movl $0, %ebx               # return value
int $0x80                   # system call

.end
