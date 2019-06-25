; Program 5.1
; Conditional Jump - MASM (64-bit)
; Copyright (c) 2019 Hall & Slonka

extrn ExitProcess : proc

.data
wages DWORD 46000
taxes DWORD ?

.code
_main PROC

 mov eax, 50000
 cmp wages, eax
 jae higher
 mov taxes, 2000
 jmp done

higher:
 mov taxes, 4000

done:
xor rcx, rcx
call ExitProcess
_main ENDP

END
