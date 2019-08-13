# Program 7.1
# CMPS - GAS, Clang/LLVM on Linux (32-bit)
# Copyright (c) 2017 Hall & Slonka

.data
src: .ascii "Test sentence!\n\0"
.equ lenSrc, (. - src)
dst: .ascii "Test sentence!\n\0"
.equ lenDst, (. - dst)

.text
.globl _main
_main:

# compare string lengths
movl $lenSrc, %eax
cmpl $lenDst, %eax
jne notequal

# when lengths are equal execute CMPS
leal src, %esi
leal dst, %edi
movl $lenSrc, %ecx
cld
repe cmpsb

# after CMPS, see if it ended successfully
jnz notequal

# equality things
jmp done

notequal:
# non-equality things

done:
movl $1, %eax
movl $0, %ebx
int $0x80
.end
