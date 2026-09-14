; Program 4.1
; Addition and Subtraction - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
sum DWORD 0
val DWORD 25

.code
_main PROC

sub rsp, 28h ;see important notes in FAQ

mov eax, 0
inc eax
add eax, 200
sub eax, val
mov sum, eax
dec sum
neg sum

xor rcx, rcx
call ExitProcess
_main ENDP

END
