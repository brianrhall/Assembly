; Program 3.2
; Working Example - NASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

SECTION .data                     ; Section for variable definitions

decimalLiteral:   DB 31           ; Variable storing 31
hexLiteral:       DQ 0Fh          ; Variable storing F (15 in decimal)
charLiteral:      DB 'A'          ; Variable storing 65 in decimal

; Variable containing a string that has a line break and is null-terminated
stringLiteral:    DB "This is a string that",0ah
                  DB "has a line break in it.",0

; Variable that calculates the value of an expression to determine the
; length, in bytes, of the variable "stringLiteral" by subtracting the
; starting memory address of the variable from the current memory address
lenString:        EQU ($ - stringLiteral)

SECTION .bss                      ; Section for uninitialized variables
unInitVariable:   RESQ 1          ; 4-byte uninitialized variable

SECTION .text                     ; Section for instructions
global _main                      ; Make the label "_main"
                                  ; available to the linker as an
                                  ; entry point for the program
_main:                            ; Label for program entry

; Label and instruction on
; the same line below
partOne: mov rax, 10              ; Assign 10 to the rax register
add rax, [hexLiteral]             ; Add the value in hexLiteral to
                                  ; the contents of the rax register
                                  ; and store the result in rax

partTwo:                          ; Label on its own line
inc rax                           ; Increment the value in rax

mov rax, 60                       ; Set the system call for exit
xor rdi, rdi                      ; Set the return value in rdi (0)
syscall                           ; Issue the kernel interrupt
