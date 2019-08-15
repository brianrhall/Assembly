; Console Output
; Materials - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

; Solution must use system call information from Chapter 10
; Use the CONSOLE subsystem (in project properties)
; Build, then run in a console window

extrn GetStdHandle : proc
extrn WriteConsoleA : proc
extrn ExitProcess : proc

.data
bytesWritten QWORD 0			; for WriteConsoleA
stdHandle QWORD 0			; for WriteConsoleA
s1 BYTE "Hello Universe", 13, 10, 0
lenS1 = ($ - s1)

.code
_main PROC

	sub rsp, 10h			; reserve for return and rbp
	sub rsp, 8h			; reserve for parameters
	sub rsp, 20h			; reserve shadow space for regs

print:
 					; get STDOUT handle
  	mov rcx, -11			; request STD_OUTPUT_HANDLE (-11)
  	call GetStdHandle		; call WinAPI to get console handle
  	mov stdHandle, rax		; save stdHandle

	mov rcx, stdHandle		; STD_OUPUT_HANDLE
	mov rdx, OFFSET s1		; string address
	mov r8, lenS1			; bytes to write
	mov r9, OFFSET bytesWritten	; bytes written
  	push 0				; reserved, push NULL
  	call WriteConsoleA		; call win api to write text to console

	add rsp, 38h			; clean up stack

done:	
xor rcx, rcx
call ExitProcess
_main ENDP

END
