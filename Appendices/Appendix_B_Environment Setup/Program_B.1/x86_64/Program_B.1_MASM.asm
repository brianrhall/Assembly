; Program B.1
; Template - MASM (64-bit)
; Copyright (c) 2018 Hall & Slonka

extrn ExitProcess : proc

.DATA
num QWORD 80
sum QWORD ?

.CODE

_main PROC
mov rax, num
add rax, 20
mov sum, rax

mov rcx, 0
call ExitProcess
_main ENDP

END
