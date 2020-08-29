; Program 3.1
; Sample Assembly Program - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc

.data
sum QWORD 0

.code
_main PROC 
mov rax, 25
mov rbx, 50 
add rax, rbx
mov sum, rax

xor rcx, rcx
call ExitProcess
_main ENDP
END
