# Program 7.2
# SCAS - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
src: .ascii "Test sentence\0"
.equ lenSrc, (. - src)
search: .ascii "s"

.text
.globl _main
_main:

xor %eax, %eax
movb search, %al
leal src, %edi
movl $lenSrc, %ecx
cld
repne scasb

# after SCAS, test for success
jnz notfound

# found things
jmp done

notfound:
# non-found things

done:
movl $1, %eax
movl $0, %ebx
int $0x80
.end
