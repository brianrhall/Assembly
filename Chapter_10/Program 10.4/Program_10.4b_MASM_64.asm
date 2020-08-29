; Program 10.4b
; Windows API Calls - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn GetCurrentProcessId : proc
extrn ExitProcess : proc
extrn MessageBoxA : proc

.DATA
output BYTE "Computer Architecture",0
caption BYTE "Message", 0
decimal QWORD 10
PID QWORD 0
button QWORD 0

.CODE
_main PROC				; Print "Computer Architecture"
	
	push rbp			; save frame pointer
	sub rsp, 10h			; reserve for return and rbp
	sub rsp, 20h			; reserve shadow space for regs
    
	xor rcx, rcx			; 0 handle owner
	lea rdx, output			; pass text address
	lea r8, caption			; pass caption address
	xor r9, r9			; 0 MB_OK
	call MessageBoxA
	mov button, rax			; save button clicked

	call GetCurrentProcessId
	mov PID, rax

	mov rdi, OFFSET [PID+3]		; Pointer to end of PID string
convert:
	xor    rdx, rdx
	div    decimal			; Divide by 10
	add    rdx, 48			; Add 48 to remainder
	mov    BYTE PTR [rdi], dl	; Store
	dec    rdi			; Next digit
	cmp    rax, 0			; Is EAX = 0?
	jg     convert			; If greater than 0, more digits

	xor rcx, rcx			; 0 handle owner
	lea rdx, PID			; pass text address
	lea r8, caption			; pass caption address
	xor r9, r9			; 0 MB_OK
	call MessageBoxA
	mov button, rax			; save button clicked

	add rsp, 30h			; clean up stack, may need removed depending on Version
	pop rbp				; restore frame pointer

xor rcx, rcx
call ExitProcess
_main ENDP

END
