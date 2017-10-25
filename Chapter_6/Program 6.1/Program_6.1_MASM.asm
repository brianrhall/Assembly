; Program 6.1
; Sum Program - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, C
ExitProcess PROTO stdcall, dwExitCode:DWORD

.data
num1 DWORD 2
num2 DWORD 4

.code
_main PROC

mov eax, 10
dec eax
mov ebx, 5

push num2
push num1
call _sum
add esp, 8

add eax, ebx
dec eax

INVOKE ExitProcess, 0
_main ENDP

_sum PROC
push ebp
mov ebp, esp
push ebx
mov ebx, [ebp + 8]
mov eax, [ebp + 12]
add eax, ebx
pop ebx
pop ebp
ret
_sum ENDP

END
