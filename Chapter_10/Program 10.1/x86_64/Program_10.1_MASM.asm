; Program 10.1
; Using Segment Selectors - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc

.DATA
array DWORD 3, 2, 6, 4, 1

.CODE
_main PROC

mov rax, OFFSET array		; array address to rax
mov ebx, [rax + 4]		; second element to ebx

; mov ecx, ds:[array]		; first element to ecx (assembler error)
; mov edx, ds:[array+8]		; third element to edx (assembler error)
; error: "illegal use of segment register"
; only fs and gs overrides are allowed in MASM x64

mov rsi, gs			; gs to rsi
mov r8, QWORD PTR gs:[rsi]	; save data at gs:offset to be used
mov r9, QWORD PTR gs:[rsi + 4]	; save data at gs:offset to be used
mov QWORD PTR gs:[rsi], 42	; 42 to gs:(offset in rsi)
mov rdi, QWORD PTR gs:[rsi]	; gs:offset to rdi 
mov QWORD PTR gs:[rsi + 4], 43	; 43 to gs:offset
mov rdi, QWORD PTR gs:[rsi + 4]	; gs:offset to rdi
mov QWORD PTR gs:[rsi], r8	; restore gs:offset data
mov QWORD PTR gs:[rsi + 4], r9	; restore gs:offset data

; since Microsoft Windows uses the gs segment for thread blocks
; we must save and restore the data or an exception will occur

xor rcx, rcx
call ExitProcess
_main ENDP

END