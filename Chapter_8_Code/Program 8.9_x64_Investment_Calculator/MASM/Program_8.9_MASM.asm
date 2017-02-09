; Program 8.9
; x86_64 Investment Calculator - MASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

; This program calculates a monthly deposit needed to reach an investment
; value, given the future value, interest rate (%), and duration (months)


_printString PROTO		; declare external functions
_printDouble PROTO
_getDouble PROTO
_getInt PROTO

.data
align 16			; align data on 16-byte boundary
amountNeeded   REAL8 0.0
interestRate   REAL8 0.0
interest       REAL8 0.0
monthlyPayment REAL8 0.0
duration       QWORD 0		; integer data
const100       REAL8 100.0
const12        REAL8 12.0
const1         REAL8 1.0

amountMessage   BYTE  13, 10, "       Enter Amount Needed:  $",0
interestMessage BYTE  "       Enter Interest Rate:  ",0
durationMessage BYTE  "Enter Duration (in months):  ",0
paymentMessage  BYTE  "    Monthly Payment Amount:  $",0

.code
_asmMain PROC

push rbp
sub rsp, 20h
lea rbp, [rsp + 20h]		; align stack pointer

lea rcx, amountMessage		; pass char* to print
call _printString
call _getDouble			; get and store amountNeeded
movsd amountNeeded, xmm0

lea rcx, interestMessage	; pass char* to print
call _printString
call _getDouble			; get interestRate as a %

movsd xmm1, const100		; divide rate by 100
divsd xmm0, xmm1
movsd interestRate, xmm0	; store rate as decimal value

lea rcx, durationMessage	; pass char* to print
call _printString
call _getInt			; get and store duration
mov duration, rax

movsd xmm0, const12		; interest = interestRate / const12
movsd xmm1, interestRate
divsd xmm1, xmm0
movsd interest, xmm1

movsd xmm0, interest		; investment formula (see Ch8 Supplement)
movsd xmm1, amountNeeded
mulsd xmm1, xmm0		; interest * amount needed, then store
movsd xmm2, xmm1

addsd xmm0, const1		; add 1 to interest
mov rcx, duration		
call _pow			; pow(interest, duration)
subsd xmm0, const1		; subtract 1 from result
vdivsd xmm1, xmm2, xmm0
movsd monthlyPayment, xmm1	; complete formula with division

lea rcx, paymentMessage		; pass char* to print
call _printString
movsd xmm0, monthlyPayment
call _printDouble		; print monthlyPayment

lea rsp, [rbp]
pop rbp
ret				; end _asmMain
_asmMain ENDP


_pow PROC			; pow function
push rbp
sub rsp, 20h
lea rbp, [rsp + 20h]
dec rcx				; use rcx for loop countdown
movsd xmm1, xmm0

exp:				; multiply by value duration times
mulsd xmm0, xmm1
loop exp

lea rsp, [rbp]
pop rbp
ret				; end _pow
_pow ENDP

END
