# Program 7.2
# SCAS - GAS, Clang/LLVM on macOS (32-bit)
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
pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
