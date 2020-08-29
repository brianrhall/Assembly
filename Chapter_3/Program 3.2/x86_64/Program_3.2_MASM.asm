; Program 3.2
; Working Example - MASM (64-bit)
; Copyright (c) 2020 Hall & Slonka

extrn ExitProcess : proc	    ; Prototype for ExitProcess method


.data                               ; Section for variable definitions

decimalLiteral    BYTE 31           ; Variable storing 31
hexLiteral        QWORD 0Fh         ; Variable storing F (15 in decimal)
charLiteral       BYTE 'A'          ; Variable storing 65 in decimal
unInitVariable    QWORD ?           ; 4-byte uninitialized variable

; Variable containing a string that has a line break and is null-terminated
stringLiteral     BYTE "This is a string that",0dh,0ah
                  BYTE "has a line break in it.",0

; Variable that calculates the value of an expression to determine the
; length, in bytes, of the variable "stringLiteral" by subtracting the
; starting memory address of the variable from the current memory address
lenString         EQU ($ - stringLiteral)

.code                             ; Section for instructions
_main PROC                        ; Start of "_main" procedure

; Label and instruction on
; the same line below
partOne: mov rax, 10              ; Assign 10 to the rax register
add rax, hexLiteral               ; Add the value in hexLiteral to
                                  ; the contents of the rax register
                                  ; and store the result in rax

partTwo:                          ; Label on its own line
inc rax                           ; Increment the value in rax

xor rcx, rcx			  ; Set the return value in rcx (0)
call ExitProcess                  ; Call the ExitProcess method
_main ENDP                        ; End of "_main" procedure
END                               ; End assembling

