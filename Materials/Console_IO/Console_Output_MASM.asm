; Console Output
; Materials - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

; Solution must use system call information from Chapter 10
; Use the CONSOLE subsystem (in project properties)
; Build, then run in a console window

.386
.MODEL FLAT, stdcall
.STACK 4096
GetStdHandle PROTO, nStdHandle:DWORD
WriteConsoleA PROTO,		              	
	      hConsoleOutput:DWORD,		; output handle
	      lpBuffer:PTR BYTE,		; pointer to buffer
	      nNumberOfCharsToWrite:DWORD, 	; size of buffer
	      lpNumberOfCharsWritten:PTR DWORD, ; num bytes written
	      lpReserved:DWORD			; not used (NULL)
ExitProcess PROTO, dwExitCode:DWORD

.data
bytesWritten DWORD 0			; for WriteConsoleA
stdHandle DWORD 0			; for WriteConsoleA
s1 BYTE "Hello Universe", 13, 10, 0
lenS1 = ($ - s1)

.code
_main PROC

print:
 					; get STDOUT handle
  	push -11			; request STD_OUTPUT_HANDLE (-11)
  	call GetStdHandle		; call WinAPI to get console handle
  	mov stdHandle, eax		; save stdHandle

  	push 0				; reserved, push NULL
	push OFFSET bytesWritten	; bytes written
	mov eax, lenS1
	push eax			; bytes to write
	push OFFSET s1			; string address
	push stdHandle			; STD_OUPUT_HANDLE
  	call WriteConsoleA		; call win api to write text to console

done:	
INVOKE ExitProcess, 0
_main ENDP
END
