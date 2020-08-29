; Program 6.1
; Sum Program - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc

.data
num1 DWORD 2
num2 DWORD 4

.code
_main PROC

mov rax, 10
dec rax
mov rbx, 5

movsxd rcx, num1
movsxd rdx, num2
call _sum

add rax, rbx
dec rax

xor rcx, rcx
call ExitProcess
_main ENDP

_sum PROC
push rbp
push rbx
sub rsp, 20h
lea rbp, [rsp + 20h]
mov rax, rcx
add rax, rdx
lea rsp, [rbp]
pop rbx
pop rbp
ret
_sum ENDP
END
