# Assembly
*Assembly Programming and Computer Architecture for Software Engineers* Code Repository
## Running the code
### NASM
For 32-bit:
1. nasm -f elf32 prog.asm
2. ld -e _main -melf_i386 -o prog.o
