; Program 4.4
; Array - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc

.data
array QWORD 1, 2, 3, 4

.code
_main PROC

; Load using byte offsets
lea rsi, array 
mov rax, QWORD PTR [rsi]
mov rbx, QWORD PTR [rsi + 8]

; Save using indices
mov rdx, 2
mov QWORD PTR [rsi+rdx*8], 10
mov rdx, 3
mov QWORD PTR [rsi+rdx*8], 20

xor rcx, rcx
call ExitProcess
_main ENDP
END
