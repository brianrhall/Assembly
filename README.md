# Assembly
*Assembly Programming and Computer Architecture for Software Engineers* Code Repository
## Running the code
### NASM
For 32-bit:<br />
1. nasm -f elf32 prog.asm<br />
2. ld -e _main -melf_i386 -o prog.o<br />
<br />
For 64-bit:<br />
1. nasm -f elf64 prog.asm<br />
2. ld -e _main -melf_x86_64 -o prog.o<br />
