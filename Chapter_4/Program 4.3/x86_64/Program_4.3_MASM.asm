; Program 4.3
; Negative Division - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc

.code
_main PROC

sub rsp, 28h ;see important notes in FAQ

mov rax, -534 
cqo
mov rbx, 15 
idiv rbx

xor rcx, rcx
call ExitProcess
_main ENDP

END
