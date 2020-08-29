; Program 5.1
; Conditional Jump - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc

.data
wages QWORD 46000 
taxes QWORD ?

.code
_main PROC

mov rax, 50000 
cmp wages, rax 
jae higher
mov taxes, 2000 
jmp done

higher:
mov taxes, 4000

done:
xor rcx, rcx
call ExitProcess
_main ENDP

END
