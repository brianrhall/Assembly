; Program 5.4
; while Loop - MASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

extrn ExitProcess : proc

.code
_main PROC

mov rax, 30
while:
   cmp rax, 50
   jae done
   inc rax
   jmp while
done:

mov rcx, 0
call ExitProcess
_main ENDP
END
