; Program 4.3
; Negative Division - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.code
_main PROC

mov eax, -534
cdq
mov ebx, 15
idiv ebx

xor rcx, rcx
call ExitProcess
_main ENDP

END
