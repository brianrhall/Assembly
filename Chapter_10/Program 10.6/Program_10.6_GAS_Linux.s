# Program 10.6
# SYSCALL on Linux (GAS, Clang/LLVM 64-bit)
# Copyright (c) 2017 Hall & Slonka

.data
output:    .ascii "Computer Architecture\n"
len: .quad (. - output)
file_name: .asciz "output.txt"
file_handle: .long 0

.text
.global _main
_main:

movq $1, %rax                   # system write (1)
movq $1, %rdi                   # file handle STDOUT (1)
leaq output(%rip), %rsi         # address
movq len(%rip), %rdx            # length
syscall

movq $2, %rax                   # system open (2)
leaq file_name(%rip), %rdi      # path
movq $0101, %rsi                # flags (01=O_CREAT, 01=O_WRONLY)
movq $0666, %rdx                # mode (permissions)
syscall
movq %rax, file_handle(%rip)

movq $1, %rax                   # system write (1)
movq file_handle(%rip), %rdi    # file handle
leaq output(%rip), %rsi         # address
movq len(%rip), %rdx            # length
syscall

movq $3, %rax                   # system close (3)
movq file_handle(%rip), %rdi    # file handle
syscall

movq $60, %rax
xorq %rdi, %rdi
syscall
.end
