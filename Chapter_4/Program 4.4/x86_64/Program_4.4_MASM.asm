; Program 4.4
; Array - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
array DWORD 1, 2, 3, 4

.code
_main PROC

; Load using byte offsets
mov eax, array
mov ebx, [array + 4]

; Save using indices
mov rdx, 2
mov [array + rdx * 4], 10
mov rdx, 3
mov [array + rdx * 4], 20

xor rcx, rcx
call ExitProcess
_main ENDP

END