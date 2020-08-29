; Program 4.2
; Multiplication and Division - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc

.data
mval QWORD 664751
dval QWORD 8

.code
_main PROC

; MUL 1-op
mov rax, mval 
mov rbx, 8 
mul rbx

; IMUL 1-op
mov rax, mval 
mov rbx, 8 
imul rbx

; IMUL 2-op
mov rax, 8 
imul rax, mval

; IMUL 3-op
imul rax, mval, 8

; DIV 1-op
mov rdx, 0
mov rax, 5318008 
mov rcx, dval 
div rcx

; IDIV 1-op
mov rdx, 0
mov rax, 5318008 
mov rcx, dval 
idiv rcx

xor rcx, rcx
call ExitProcess
_main ENDP 
END
