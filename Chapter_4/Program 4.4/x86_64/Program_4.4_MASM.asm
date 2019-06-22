; Program 4.4
; Array - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
array DWORD 1, 2, 3, 4

.code
_main PROC

; Load using byte offsets
lea rsi, array
mov eax, DWORD PTR [rsi]
mov ebx, DWORD PTR [rsi + 4]

; Save using indices
mov rdx, 2
mov DWORD PTR [rsi + rdx * 4], 10
mov rdx, 3
mov DWORD PTR [rsi + rdx * 4], 20

xor rcx, rcx
call ExitProcess
_main ENDP

END