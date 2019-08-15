; Program 10.1
; Using Segment Selectors - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.DATA
array DWORD 3, 2, 6, 4, 1

.CODE
_main PROC

mov rax, OFFSET array	; array address to rax
mov ebx, [rax+4]	; second element to ebx
; mov ecx, ds:[array]	; first element to ecx (compiler error)
; mov edx, ds:[array+8]	; third element to edx (compiler error)
; "error: "illegal use of segment register"

xor rcx, rcx
call ExitProcess
_main ENDP

END
