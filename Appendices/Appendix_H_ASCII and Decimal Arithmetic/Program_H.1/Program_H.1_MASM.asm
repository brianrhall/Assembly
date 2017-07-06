; Program H.1
; ASCII Adjust after Addition - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD

.DATA
num1 BYTE '8'
num2 BYTE '2'

.CODE
_main PROC
    
xor ax, ax      ; must clear so it doesn’t influence the adjust
mov al, num1
add al, num2
aaa             ; ascii adjust
or ax, 3030h    ; convert to ascii

INVOKE ExitProcess, 0
_main ENDP
END
