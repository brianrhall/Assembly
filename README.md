# Assembly Programming and Computer Architecture for Software Engineers (APCASE)

#### * Code Repository - some assembly required...git it? *

## About
<img src = "./content/Cover.png" align="right" alt = "Cover" width="320" border="1" hspace="10" vspace="5">

Welcome to the code repository for our book! *APCASE* is a very practical and comprehensive educational text for students, educators, and professionals seeking to learn about Assembly programming and computer architecture. But what makes our book helpful and unique?

- Based on x86 and x86_64 architecture.
- All programming examples are provided for three common assemblers: GAS (Clang/LLVM), MASM, and NASM, which ensures both AT&T and Intel syntax. This allows for learning on any OS platform: Mac, Windows, and Linux.
- Context and examples provided in both 32-bit and 64-bit, both of which are useful for a programmer.
- Code-oriented and detailed overviews of function calls, floating-point operations (x87 through AVX), inline Assembly, and system calls, all in one book.
- Brief introduction and code examples for other modern architectures like ARM, AVR, RISC-V, and z/Architecture.
- The Appendices provide practical information and guide students in learning Assembly programming.
- Chapter Supplements provide a deeper dive on topics as necessary.
- Links to wikis, developer resources, and videos are provided to assist in further exploration of topics.
- Attention, Programming, and Learning notes are placed throughout the text to guide the reader in beneficial ways.

| [Prospect Press](http://www.prospectpressvt.com/) | eBook | Print Book (306 pages) |
|----------------|-------|------------|
| Price     | $44 | $68 |
| Sources   | [Redshelf.com](https://www.redshelf.com/book/742712/assembly-programming-and-computer-architecture-for-software-engineers-742712-9781943153312-brian-r-hall-and-kevin-j-slonka), [Vital Source](https://www.vitalsource.com/products/assembly-programming-and-computer-architecture-for-brian-r-hall-and-kevin-j-v9781943153312) | [Redshelf.com](https://www.redshelf.com/book/742712/assembly-programming-and-computer-architecture-for-software-engineers-742712-9781943153312-brian-r-hall-and-kevin-j-slonka), [CreateSpace](https://www.createspace.com/7060151), [Amazon Europe](https://www.amazon.de/Assembly-Programming-Computer-Architecture-Engineers/dp/1943153329/) |
| ISBN      | 978-1-943153-31-2 | 978-1-943153-32-9 |

Is this book for you? Checkout the [Preface](./content/Assembly_Preface_GitHub.pdf), a free [Chapter 3: Assembly and Syntax Fundamentals](./content/Assembly_Ch_3_GitHub.pdf), and the free [Appendices](#appendices).

---

### Chapter Roadmap

![Alt](./content/ChapterRoadmap.png "Chapter Roadmap")

---

<a name="appendices"></a>
### Appendices
Appendices A, B, E, and I are available for free.

- Introduction to the Appendices
- [Appendix A: Assembly Translation](./content/Assembly_App_A_GitHub.pdf)
- [Appendix B: Environment Setup](./content/Assembly_App_B_GitHub.pdf)
- Appendix C: Disassembly
- Appendix D: Command-Line Debugging Assembly with GDB
- [Appendix E: Linking Assembly and C++](./content/Assembly_App_E_GitHub.pdf)
- Appendix F: Functions and Stack
- Appendix G: Using CPUID
- Appendix H: ASCII and Decimal Arithmetic
- [Appendix I: Intrinsics](./content/Assembly_App_I_GitHub.pdf)


---

### Links

- Book Website (@ProspectPressVT): [http://www.prospectpressvt.com/titles/hall-assembly-programming/](http://www.prospectpressvt.com/titles/hall-assembly-programming/)
- YouTube Channel (Book Videos): [https://www.youtube.com/channel/UCr0svQEez3UQvlj6-5EYS6w](https://www.youtube.com/channel/UCr0svQEez3UQvlj6-5EYS6w)
- Brian's Website: [http://www.brianrhall.net](http://www.brianrhall.net)
- Kevin's Website: [http://www.kevinslonka.com](http://www.kevinslonka.com)
- Organized collection of all links in APCASE: [Book_Links.md](./Book_Links.md)

---

### Citing this Book

When citing code snippets or other content from the repository or book, please cite the original source:

**BibTeX**:

```
@Book{APCASE,
author = {Hall, B. R. and Slonka, K. J.},
title = {Assembly Programming and Computer Architecture for Software Engineers},
publisher = {Prospect Press},
year = {2018},
address = {Burlington, VT},
isbn = {978-1-943153-32-9}
}
```

**APA**:

Hall, B. R. & Slonka, K. J. (2018). *Assembly Programming and Computer Architecture for Software Engineers*. Burlington, VT: Prospect Press.

---


## FAQ

- [How do I assemble and link on Linux?](#linux)
- [Do I use the .globl or .global directive for *main* in GAS?](#global)

<a name="linux"></a>
#### How do I assemble and link on Linux?
Here are some example `nasm` and `as` commands to assemble and link in Linux. The GAS examples in the book assume you are using Xcode on macOS, which uses Clang/LLVM. So, if you are using GAS on Linux, remember to change the exit routine.

|    Linux     | NASM 32-bit | NASM 64-bit |
|--------------|-----------|-----------|
| Assemble     | `nasm -f elf32 prog.asm` | `nasm -f elf64 prog.asm` |
| Link         | `ld -e _main -melf_i386 -o prog prog.o` | `ld -e _main -melf_x86_64 -o prog prog.o` |
| Exit Routine | `mov eax, 1`<br>`mov ebx, 0`<br>`int 80h` | `mov rax, 60`<br>`xor rdi, rdi`<br>`syscall` |


|    Linux     | GAS 32-bit | GAS 64-bit |
|--------------|-----------|-----------|
| Assemble     | `as --32 -o prog.o prog.s` | `as --64 -o prog.o prog.s` |
| Link         | `ld -e _main -melf_i386 -o prog prog.o` | `ld -e _main -melf_x86_64 -o prog prog.o` |
| Exit Routine | `mov $1, %eax`<br>`mov $0, %ebx`<br>`int $0x80` | `mov $60, %rax`<br>`xor %rdi, %rdi`<br>`syscall` |

<a name="global"></a>
#### Do I use the .globl or .global directive for *main* in GAS?
Either. In the past, GAS used the .globl directive (without the *a*), but eventually updated the assembler to accept .global as well. We use .globl in the GAS examples and programs in the book.

## Errata
- Errors have yet to be found...

## Contact
We are very happy to answer any questions or consider suggestions you might have about the text. Just email one of us! <br>
<a href="mailto:hall@champlain.edu">Brian</a> (author) or <a href="mailto:beth.golub@prospectpressvt.com">Beth</a> (publisher)
