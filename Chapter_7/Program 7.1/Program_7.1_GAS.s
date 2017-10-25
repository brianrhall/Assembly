# Program 7.1
# CMPS - GAS, Clang/LLVM on macOS (32-bit)
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
pushl $0
subl $4, %esp
movl $1, %eax
int $0x80
.end
