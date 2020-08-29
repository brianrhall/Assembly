; Program 10.4a
; Windows API Calls - MASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

.386
.MODEL FLAT, stdcall
.STACK 4096

GetCurrentProcessId PROTO
ExitProcess PROTO, dwExitCode:DWORD
MessageBoxA PROTO, hwnd:DWORD, text:DWORD, caption:DWORD, buttons:DWORD

.DATA
output BYTE "Computer Architecture",0
caption BYTE "Message", 0
decimal DWORD 10
PID DWORD ?

.CODE
_main PROC				; Print "Computer Architecture"
    
	push 0				; MB_OK (0 = OK button only)
   	push OFFSET caption		; lpCaption
    	push OFFSET output		; lpText
    	push 0				; hWnd handle owner window (0 = no owner)
    	call MessageBoxA

	INVOKE GetCurrentProcessId
	mov PID, eax

	mov edi, OFFSET [PID+3]		; Pointer to end of PID string
convert:
	xor    edx, edx
	div    decimal			; Divide by 10
	add    edx, 48			; Add 48 to remainder
	mov    BYTE PTR [edi], dl	; Store
	dec    edi			; Next digit
	cmp    eax, 0			; Is EAX = 0?
	jg     convert			; If greater than 0, more digits

	INVOKE MessageBoxA, 0, OFFSET PID, OFFSET caption, 0

INVOKE ExitProcess, 0
_main ENDP
END
