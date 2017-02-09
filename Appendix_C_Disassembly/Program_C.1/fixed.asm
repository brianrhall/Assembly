; code.asm


.386

.MODEL flat, stdcall

.STACK 4096



inputInteger PROTO C



.DATA

integer DWORD ?



.CODE

asmMain PROC C



call inputInteger



mov integer, eax



   ret

asmMain ENDP

END