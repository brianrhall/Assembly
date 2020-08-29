; Program 5.2
; Looping - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc

.code
_main PROC

xor rax, rax
mov rcx, 5

myLoop:
  inc rax
  loop myLoop

xor rcx, rcx
call ExitProcess
_main ENDP
END
