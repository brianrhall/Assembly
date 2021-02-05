# Frequently Asked Questions

***Important Notes***

- If you are using macOS High Sierra (10.3) and XCode 9 or later (very likely), you will discover that the i386 architecture is deprecated, and you must use x86_64. We have provided both 32-bit and 64-bit programs where possible but we recommend Edition 2 that has a 64-bit focus. **The macOS 10.14 SDK and later do not support 32-bit applications. If you want to write 32-bit programs for i386 on macOS, Xcode 9.4 or earlier is required.**

***Book***

- [Why learn Assembly? Is it even used anymore?](#why)
- [Why x86? Is it too complex for students?](#x86)
- [Why have code for multiple assemblers? Is it confusing?](#assemblers)
- [Why no custom software (e.g., libraries, macros, environments)?](#software)
- [Is the GAS and Clang/LLVM code for macOS or Linux?](#GAS)
- [What if a web link in the book is broken? / Is there a place with all active web links?](#book_links)
- [What if students or instructors want to be able to perform console I/O before Chapter 6 and/or Chapter 10?](../Materials/Console\_IO/)
- [Are there various syntax examples of the Chapter 6 detailed cdecl walkthough?](../Materials/cdecl/README.md)
- [Which provider should I choose for the eBook?](#eBook)

***Teaching***

- [How do the authors pace a semester using the text? / Is there an example course outline?](../Materials/WeeklyOutlineExample/)
- [Chapter Highlights - What is most important, what do students typically struggle with, and what should students not forget for each chapter?](../Materials/ChapterHighlights/README.md)

***Programming***

- [How do I assemble and link on Linux?](#linux)
- [How do I assemble and link on macOS (Terminal)?](#mac)
- [Do I use the .globl or .global directive for *main* in GAS?](#global)
- [How do I use GDB or LLDB for command-line debugging?](../Materials/GDB\_LLDB/)

---

<a id="why"></a>
#### Why learn Assembly? Is it even used anymore?
Yes. Every bit of code must be translated to run on a processor in its native instruction set. Assembly language is necessary for running software on hardware. More explanation can be found in the main text, but here are some abbreviated notes from *Chapter 1*.

- Enhance your understanding of computer operation 
- Debugging
- Make informed implementation decisions
- Remove layers of abstraction from tasks- Areas of software development that rely on intimate knowledge of Assembly, such as programming forembedded devices, programming device drivers, and system (OS) programming
- Talking directly to the processor...come on, that's cool

---

<a id="x86"></a>
#### Why x86? Is it too complex for students?
Keep in mind that this text is geared toward applied computer science and software engineering students. Based on our experiences teaching the course, students can handle x86 with our approach.

Although x86 is a complex architecture, it is the most common architecture in laptops and desktops, the systems students are using every day. In the book, we do not cover the entire instruction set detail by detail (Intel's documentation does that). We cover what is necessary to illustrate the principles of computer architecture and simultaneously give students useful context applicable to the systems they are using and on which they are developing software. We do give introductions to other important architectures in *Chapter 11*.

We are contemplating writing an ARM supplement for the text since x86 and ARM are the two most dominant architectures in the computing market. But ARM isn't so simple either.

---

<a id="assemblers"></a>
#### Why have code for multiple assemblers? Is it confusing?
Importantly, it is a feature: you have choice!

A simple explanation I (Brian) give students for the different syntaxes is that there are different assemblers that can translate x86 Assembly into machine code. Just like there are different compilers that translate C++ code into executable machine code (gcc, clang, Visual C++, Intel C++, etc.). And the resulting code may be similar, but can have differences, pros, and cons. One quick example is methods of stack alignment. Another is that one compiler (e.g., Intel C++) may be tuned to use packed operations whereas other compilers may not.

When I teach the course, I do allow students to choose which environment they want. They can even switch from assignment to assignment. It is one of the main reasons we wrote the book the way we did. We wanted instructors and students to be able to use whatever environment they wanted and have the ability to try different things. I disliked other popular texts only using Visual Studio/MASM and esoteric approaches to some topics. I am sure there are some profs out there that will take my approach and I am sure there are plenty that will choose one syntax and require all work in that syntax, as it would simplify grading and such. I do my work on a Mac, so I have Xcode for GAS (Clang/LLVM) on macOS, a Windows VM for using Visual Studio/MASM, and an Ubuntu VM that I use for Linux/NASM code. As an instructor, I am used to the different syntaxes so switching between them and grading work in them is not so problematic. But, one syntax can be chosen and that thread followed through the text. The point is you have choice.

In the classroom, I will go back and forth between syntax examples, depending on what points I am trying to make and things to watch for in each syntax. Most of my students use Visual Studio/MASM on Windows, quite a few use Linux/NASM, and some use Xcode on macOS. I try to showcase a little bit of each. Some assignments, like those in *Chapter 3*, especially 3.3, have students spend a little time with an assembler that they probably won’t be using. I think a little translation knowledge between syntaxes is useful because if students are looking online at examples, they may find help or some code, but it may be written in a syntax they are not using, and they should be able to translate the code (with some documented guidance such as [Appendix A](../content/Edition2/Assembly_Ed2_App_A_GitHub.pdf)). My students get very familiar with whatever syntax/environment they have chosen, and then also get some tangential knowledge in the others.

I do have students answer the text questions as-is, again, building that cross-syntax knowledge, but having students answer some of the short answer and T/F questions in a single syntax is certainly a possible approach.

---

<a id="software"></a>
#### Why no custom software (e.g., libraries, macros, environments)?
Importantly, it is not needed and would be non-standard. One example is getting students started with Input/Output, which we address here: [Materials/Console_IO](../Materials/Console\_IO/)

We wanted people to be able to use Mac, Windows, or Linux standalone or simultaneously. Using custom software would lock us into a single environment or result in an exorbitant amount of code.

Some Assembly texts have 3rd-party (custom) macros and software to help simplify certain tasks, which is fine in that sense, it may help you get certain things done a little more quickly or earlier. However, students will be learning about the building blocks necessary to do tasks like I/O anyway, so it really depends on how you arrange the blocks.

We avoid non-standard environments and software because it is not how you would actually use Assembly in practice. For example, we use GitHub to get our code out to the world, because it is what modern developers use. We use system calls, standard I/O libraries, and OS APIs to do tasks like I/O. We use the latest operating systems and development environments because they all inherently have the ability to do Assembly programming without any extra software (see [Appendix B: Environment Setup](../content/Edition2/Assembly_Ed2_App_B_GitHub.pdf)).

We want students to see things in a way they are used professionally. Such an approach helps understanding well beyond Assembly programming.

---

<a id="GAS"></a>
#### Is the GAS and Clang/LLVM code for macOS or Linux?
We have provided code (.s files) for GAS, Clang/LLVM for both macOS and Linux. The GAS code shown through the book is for macOS (since we use NASM on Linux through the book), but if you are using GAS on Linux, code files are provided for you in the repository. Typically, the only difference is the exit routine. (Chapter 10 programs are more different because of system calls).

---

<a id="book_links"></a>
#### What if a web link in the book is broken? / Is there a place with all active web links?
Yes, try here -> [Book_Links.md](../Book_Links.md), which is in the file list at the top of the README. We would also appreciate if you report any broken links.

---

<a id="eBook"></a>
#### Which provider should I choose for the eBook?
Prospect Press provides a page that [compares](https://prospectpressvt.com/ordering/direct-student-orders/) the purchasing options, but we have also summarized it here. To go directly to our eBook page at the providers, just click the links below.

|    Question     | [Redshelf.com](https://redshelf.com/book/1671071) | [Vital Source](https://www.vitalsource.com/products/assembly-programming-and-computer-architecture-for-brian-r-hall-amp-kevin-j-v9781943153763) |
|----|----|----|
| Online or Download?     | Online only | Online AND Download |
| Duration?         | Permanent online access | 365 day access for online, perpetual download |
| Returnable? | Yes, within 14 days of purchase | No |
| Can I buy this in the campus bookstore? | Yes, at selected college and university bookstores. Check if your bookstore sells RedShelf ebooks. | No, not available through campus bookstores. |
|Study Tools? | Built-in study tools include highlights, study guides, annotations, definitions, flashcards, and collaboration. | Notes and highlights (synced across devices). <br>Share mark-ups with your professor or classmates—and subscribe to theirs, too. Review Mode, which allows you to look at your notes and highlights in context with your eBook without the distraction of full-reading mode. |
| Screenshot? | [Redshelf screenshot](../content/Redshelf.pdf) | [Vital Source screenshot](../content/VitalSource.pdf) |

---

<a id="linux"></a>
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

---

<a id="mac"></a>
#### How do I assemble and link on macOS (Terminal)?
Here are some example `nasm` commands to assemble and link using NASM on macOS in Terminal. Just set the minimum OS version to whatever version you wish based on your install.

|    macOS     | NASM 32-bit | NASM 64-bit |
|--------------|-----------|-----------|
| Assemble     | `nasm -f macho -o prog.o prog.asm` | `nasm -f macho64 -o prog.o prog.asm` |
| Link | `ld -macosx_version_min 10.12 -o prog prog.o -lSystem` | <- same
| Exit Routine | `push DWORD 0`<br>`sub esp, 4`<br>`mov eax, 1`<br>`int 80h` | `mov rax, 2000001h`<br>`xor rdi, rdi`<br>`syscall` |

---

<a id="global"></a>
#### Do I use the .globl or .global directive for *main* in GAS?
Either. In the past, GAS used the .globl directive (without the *a*), but eventually updated the assembler to accept .global as well. We use .globl in the GAS 32-bit programs and .global in the 64-bit examples.

---
