; Program 8.4
; SSE Packed Operations - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
ALIGN 16			; 16-byte alignment
vectorA REAL4 1.2, 3.4, 5.6, 7.8
vectorB REAL4 7.8, 5.6, 3.4, 1.2
result  REAL4 ?, ?, ?, ?	; space for storing results

.code
_main PROC

movaps xmm0, vectorA		; move aligned packed SP vectorA to XMM0
addps  xmm0, vectorB		; add vectorB to XMM0
movaps result, xmm0		; move data to result

xor rcx, rcx
call ExitProcess
_main ENDP

END
