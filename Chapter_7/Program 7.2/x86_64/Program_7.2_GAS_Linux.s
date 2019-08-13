# Program 7.2
# SCAS - GAS, Clang/LLVM on Linux (64-bit)
# Copyright (c) 2019 Hall & Slonka

.data
src: .ascii "Test sentence\0"
.equ lenSrc, (. - src)
search: .ascii "s"

.text
.global _main
_main:

xorq %rax, %rax
movb search(%rip), %al
leaq src(%rip), %rdi
movq $lenSrc, %rcx
cld
repne scasb

# after SCAS, test for success
jnz notfound

# found things
jmp done

notfound:
# non-found things

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
.end
