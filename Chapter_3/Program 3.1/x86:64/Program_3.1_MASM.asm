; Program 3.1
; Sample Assembly Program - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
sum DWORD 0

.code
_main PROC

sub rsp, 28h ;see important notes in FAQ

mov eax, 25
mov ebx, 50
add eax, ebx
mov sum, eax

xor rcx, rcx
call ExitProcess
_main ENDP

END
