; Program 5.3
; Nested for Loop - MASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

extrn ExitProcess : proc

.code
_main PROC

xor rax, rax
mov rbx, 2
outer:
   mov rcx, 3
      inner:
      inc rax
      dec rcx
      cmp rcx, 0
      jne inner
   dec rbx
   cmp rbx, 0
   jne outer

xor rcx, rcx
call ExitProcess
_main ENDP
END
