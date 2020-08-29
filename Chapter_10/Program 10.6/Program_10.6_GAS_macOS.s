# Program 10.6
# SYSCALL on macOS/BSD (GAS, Clang/LLVM 64-bit)
# Copyright (c) 2017 Hall & Slonka

.data
output:    .ascii "Computer Architecture\n"
len: .quad (. - output)
file_name: .asciz "output.txt"
file_handle: .long 0

.text
.global _main
_main:

movq $0x2000004, %rax        # system write (4)
movq $1, %rdi                # file handle STDOUT (1)
leaq output(%rip), %rsi      # address
movq len(%rip), %rdx         # length
syscall

movq $0x2000005, %rax        # system open (5)
leaq file_name(%rip), %rdi   # path
movq $0x0201, %rsi           # flags (02=O_CREAT, 01=O_WRONLY)
movq $0666, %rdx             # mode (permissions)
syscall
movq %rax, file_handle(%rip)

movq $0x2000004, %rax        # system write (4)
movq file_handle(%rip), %rdi # file handle
leaq output(%rip), %rsi      # address
movq len(%rip), %rdx         # length
syscall

movq $0x2000006, %rax        # system close (6)
movq file_handle(%rip), %rdi # file handle
syscall

movq $0x2000001, %rax        # system exit (1)
movq $0, %rdi                # return value
syscall

.end
