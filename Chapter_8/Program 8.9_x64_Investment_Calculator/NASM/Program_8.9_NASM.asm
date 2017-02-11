; Program 8.9
; x86_64 Investment Calculator - NASM (64-bit)
; Copyright (c) 2017 Hall & Slonka

; This program calculates a monthly deposit needed to reach an investment
; value, given the future value, interest rate (%), and duration (months)


extern _printString		 ; declare external functions
extern _printDouble
extern _getDouble
extern _getInt

section .data
align 16			 ; align data on 16-byte boundary
amountNeeded:   dq 0.0
interestRate:   dq 0.0
interest:       dq 0.0
monthlyPayment: dq 0.0
duration:       dq 0		 ; integer data
const100:       dq 100.0
const12:        dq 12.0
const1:         dq 1.0

amountMessage:   db  "       Enter Amount Needed:  $",0
interestMessage: db  "       Enter Interest Rate:  ",0
durationMessage: db  "Enter Duration (in months):  ",0
paymentMessage:  db  "    Monthly Payment Amount:  $",0

section .text
global _asmMain
_asmMain:

push	rbp
mov	rbp, rsp		 ; align stack pointer

lea rdi, [rel amountMessage]	 ; pass char* to print
call _printString
call _getDouble			 ; get and store amountNeeded
movsd [rel amountNeeded], xmm0

lea rdi, [rel interestMessage]	 ; pass char* to print
call _printString
call _getDouble			 ; get interestRate as a %

movsd xmm1, [rel const100]	 ; divide rate by 100
divsd xmm0, xmm1
movsd [rel interestRate], xmm0	 ; store rate as decimal value

lea rdi, [rel durationMessage]	 ; pass char* to print
call _printString
call _getInt			 ; get and store duration
mov [rel duration], rax

movsd xmm0, [rel const12]        ; interest = interestRate / const12
movsd xmm1, [rel interestRate]
divsd xmm1, xmm0
movsd [rel interest], xmm1

movsd xmm0, [rel interest]       ; investment formula (see Ch8 Supplement)
movsd xmm1, [rel amountNeeded]
mulsd xmm1, xmm0                 ; interest * amount needed, then store
movsd xmm2, xmm1

addsd xmm0, [rel const1]         ; add 1 to interest
mov rdi, [rel duration]
call _pow			 ; pow(interest, duration)
subsd xmm0, [rel const1]         ; subtract 1 from result
vdivsd xmm1, xmm2, xmm0          
movsd [rel monthlyPayment], xmm1 ; complete formula with division

lea rdi, [rel paymentMessage]	 ; pass char* to print
call _printString
movsd xmm0, [rel monthlyPayment]
call _printDouble		 ; print monthlyPayment

pop rbp
ret				 ; end _asmMain


_pow:				 ; pow function
push rbp
mov rbp, rsp
mov rcx, rdi
dec rcx				 ; use rcx for loop countdown
movsd xmm1, xmm0

exp:				 ; multiply by value duration times
mulsd xmm0, xmm1
loop exp

pop rbp
ret
