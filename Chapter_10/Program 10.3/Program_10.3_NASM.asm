; Program 10.3
; Print Process ID with INT - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

section .data
	decimal: dd 10
section .bss
	PID: resd 1

section .text
global _main
_main:                     ; Print Process ID

mov eax, 14h               ; GET_PID call
int 80h                    ; system call
                           ; process ID is returned in EAX
mov edi, PID+3             ; Pointer to end of PID string
convert:
    xor    edx, edx
    div    DWORD [decimal] ; Divide by 10
    add    edx, 48         ; Add 48 to remainder
    mov    BYTE [edi], dl  ; Store
    dec    edi             ; Next digit
    cmp    eax, 0          ; Is EAX = 0?
    jg     convert         ; If greater than 0, more digits

mov ebx, 1      ; File descriptor STDOUT (1)
mov ecx, PID    ; String address
mov edx, 6	; String length
mov eax, 4      ; system call 4 (WRITE), prints to screen
int 80h         ; system call

mov eax, 1	; system call 1 (exit)
mov ebx, 0	; return value
int 80h		; system call
