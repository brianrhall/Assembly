; Program 4.3
; Negative Division - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.code
_main PROC

sub rsp, 28h ;see important notes in FAQ

mov eax, -534
cdq
mov ebx, 15
idiv ebx

xor rcx, rcx
call ExitProcess
_main ENDP

END
