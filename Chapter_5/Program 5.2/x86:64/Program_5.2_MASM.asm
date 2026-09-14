; Program 5.2
; Looping - MASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

extrn ExitProcess : proc

.code
_main PROC

sub rsp, 28h ;see important notes in FAQ

xor rax, rax
mov rcx, 5

myLoop:
  inc rax
  loop myLoop

mov rcx, 0
call ExitProcess
_main ENDP
END
