; Program 8.3
; MMX - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
w1 WORD 1, 2, 3, 4
w5 WORD 5, 6, 7, 8
result QWORD 0

.code
_main PROC

lea rax, w1
lea rbx, w5
movq mm0, [rax]		; move quadword w1-w4 to MM0
movq mm1, [rbx]		; move quadword w5-w8 to MM1

paddsw mm0, mm1		; add packed signed words
movq result, mm0	; move data to result

xor rcx, rcx
call ExitProcess
_main ENDP

END
