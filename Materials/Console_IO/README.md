# Console Input/Output

#### What if students or instructors want to be able to perform console Input/Output (I/O) before Chapter 6 and/or Chapter 10?

[<img src = "https://lowlevelcoder.com/wp-content/uploads/2022/08/Materials_Video1_thumb.png" align="left" alt = "Materials Video 1" width="150" border="0" hspace="0" vspace="5" style="margin-right:10px">](https://lowlevelcoder.com/materials-videos)

We have provided these console output code examples (above) and [video](https://lowlevelcoder.com/materials-videos) for instructors/students who want to introduce/learn the ability to do console I/O as early as *Chapter 3*. However, keep in mind that using functions to perform system/API calls will not be fully understood until working through *Chapters 6 and 10*.
<br><br>

###### Background:

The text does assume students have had programming up through Data Structures (preferably in C++), so students should be well versed in basic I/O using standard I/O libraries and their features (e.g., cin, cout, printf, scanf, etc).

<b>Instructors:</b> If you are using Microsoft Windows (MASM), you may have struggled with I/O over the years with Windows OS releases. Windows really wants you to use the Windows API for system calls (including I/O) instead of direct interrupts (e.g., `INT 21h` in DOS). Odd to us is how many Assembly Programming books and code examples are sticking to older methods and custom libraries. Keep in mind that our book is geared toward software engineering and applied CS students, and we believe it is much better to teach them how to use standard approaches they might actually see in the field today, as opposed to custom libraries/macros or very outdated techniques (e.g., 16-bit programming).

So…how do we do this? *Chapter 10* provides the walkthrough and really highlights the when, where, why and how of system calls, including I/O. Still, students sometimes find it easier to understand what is going on by sending output to console. And thus, here are some suggestions…hopefully in a logical order.

###### Our Suggestions:

1. <b>Use industry tools and standards.</b> For example, use Microsoft Visual Studio for MASM programming and not some custom 3rd-party software or codebase. You can use the latest versions of Windows and Visual Studio. All of our code is tested in Windows 10 and Visual Studio 2017 (it was all also tested in Windows 7 and VS 2015).

2. <b>Using INT, a library function, or API call is really the same process: using a function (or in some cases a macro) to perform I/O.</b> Again, it is best to use standard approaches when possible. Students will better understand this process after *Chapter 6*, but they will have also seen it since *Chapter 3*. The `exit` call in all of our programs is an example you can point out at any point you feel works best. Students may use system calls for a while before a full explanation or understanding, but beginning in *Chapter 3* students are seeing code that uses `INT` on macOS and Linux and the Windows API to exit a program.

3. <b>Early in the class/book ( Week/*Chapter 2 or 3* ) have students walk through [Appendix B: Environment Setup](https://github.com/brianrhall/Assembly/blob/master/content/Assembly_App_B_GitHub.pdf) and *Appendix C: Disassembly* and also *Appendix D* for NASM users.</b> Students should have some debugging experience prior to this course, but it may be minimal. It is essential that students know/learn how to set breakpoints and view registers, memory, and variables while running a program. Knowing some basic debugging skills means that through the first several programming *Chapters (3-5)*, students can figure out what their programs are doing by watching the program execute. Output to console is not necessary for understanding what is going on, and although direct output is sometimes helpful, we can over-rely on printing to screen.

	When going through the Appendices, give special attention to steps like *Appendix B, Windows, Step #14* (viewing different windows in the debugger) and other visual cues shown throughout the Appendices. 

4. <b>The first time a student may really want to do console output is if they do Assignment 5.3 in *Chapter 5*.</b> In the Instructor Materials we have this note: "Our solutions for Programs 5.3 (Challenge Assignment) and 7.2 use `INT` in macOS (GAS) and Linux (NASM) and the Windows API (MASM) to print to console. The solutions are commented, but students would have to look ahead to *Chapter 10* for more information should they choose to complete the assignments. This is indicated in the Assignment 5.3 prompt in the book."

	###### Assignment 5.3 Prepare for output! (Challenge Assignment)
	"Write a program that takes a normal 32-bit numeric value (e.g.,`0xFFFFh`) and converts it to a byte array such that it can be printed to the screen using a system call method. A loop is necessary for converting the numeric value to ASCII for output. Again, use a system call (e.g., `int 80h`) to print the value to the console (see *Chapter 10*). Calling external functions (e.g., `printf`) is not allowed for this assignment."

	###### Assignment 7.2 LOUD NOISES!
	"Write a program, using the appropriate string primitive instructions, that iterates through the string "I DON'T KNOW WHAT WE'RE YELLING ABOUT!" and converts each character to its lowercase counterpart and stores the resulting string in another location."

	Assignment 7.2 can be extended by requiring students to print the string to console to show that the case has changed. Doing so requires a system call to print (similar to Assignment 5.3), which uses information from *Chapter 10*.

	<b>If you want to teach/learn console I/O earlier in the term or book, use the console output code examples on this page to get started, which has a single string that prints to console.</b> Examine how it works. Students do not have to understand everything about it until further along in the text (just like the exit function), but with this simple working example students can cut and paste the code for basic use given temporary/minimal explanation. The code works for strings…but if you are wanting to print numbers (as in Assignment 5.3) then you also have to deal with ASCII conversion (shown in *Chapter 10* Programs 10.3 and 10.4). Again, sometimes it is easier to get students to use the debugger to step through and check the final state of values in a program. <b>Walking before running in the low-level world.</b>

5. <b>You can also do I/O using familiar C++ code, which we show in *Chapter 6* and is necessary for Assignment 6.1.</b> So even if you do not cover system I/O until *Chapter 10*, students will learn how to do I/O with a mix of C++ and Assembly as early as *Chapter 6*.

