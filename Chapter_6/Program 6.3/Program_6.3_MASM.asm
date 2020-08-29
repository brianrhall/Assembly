; Program 6.3
; Sum Program - MASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

extrn ExitProcess : proc

.data
num1 QWORD 2
num2 QWORD 4

.code
_main PROC

mov rax, 10
dec rax
mov rbx, 5

lea rcx, num1
lea rdx, num2
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
mov rax, [rcx]
add rax, [rdx]
lea rsp, [rbp]
pop rbx
pop rbp
ret
_sum ENDP
END
