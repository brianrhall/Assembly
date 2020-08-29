; Program 5.4
; while Loop - MASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

extrn ExitProcess : proc

.code
_main PROC

mov rax, 30
while_loop:
   cmp rax, 50
   jae done
   inc rax
   jmp while_loop
done:

xor rcx, rcx
call ExitProcess
_main ENDP
END
