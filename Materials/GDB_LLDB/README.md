# GDB and LLDB

#### How do I use GDB or LLDB for command-line debugging?

Watch our [video](https://lowlevelcoder.com/materials-videos#video3) which goes through the code examples above and uses GDB on Linux and LLDB on macOS to contrast the following [debugger commands](./ExampleCommands.txt). Remember that any specific addresses used in the commands will likely be different on your system!

[<img src = "https://lowlevelcoder.com/wp-content/uploads/2022/08/Materials_Video3_thumb.png" alt = "Materials Video 3" width="200" border="0" hspace="0" vspace="0">](https://lowlevelcoder.com/materials-videos#video3)

Resources:

- Appendix D: Command-line Debugging with GDB
- [https://lldb.llvm.org/lldb-gdb.html](https://lldb.llvm.org/lldb-gdb.html)

1. examine registers

	```
	(gdb) info registers
	(lldb) register read --all
	```

2. examine a specific register

	```
	(gdb) print/x $eax
	(lldb) register read eax
	(lldb) register read --format decimal eax
	```

3. examine memory

	```
	(gdb) x/8xw 0x80490b4
	(gdb) x/8dw 0x80490b4
	(lldb) x/8dw 0x2000
	(lldb) memory read/4xw 0xbffff3c0
	(lldb) x/4xw 0xbffff3c0
	```

4. examine a function

	```
	(gdb) disassemble _main
	(lldb) disassemble --name main
	```

5. examine memory where a register is pointing

	```
	(gdb) x/8xw $esp
	(lldb) x/8xw $esp
	```

6. next instruction

	```
	(gdb) nexti
	(lldb) nexti
	```

7. examine a variable

	```
	(gdb) p value
	(lldb) p/d value
	```

8. examine a string (character array)

	```
	(gdb) x/14cb 0x80490a4
	(lldb) memory read --size 1 --format c --count 14 0x2000
	```

9. examine an integer array

	```
	(gdb) x/6dw 0x80490b4
	(lldb) memory read --size 4 --format h --count 6 0x2014
	```

10. examine a floating point array

	```
	(gdb) x/4f &floats
	(lldb) x/4f &floats
	```

11. examine a specific element in an array

	```
	(gdb) x/f &floats+1
	(gdb) p (double[4])vector1
	(lldb) x/f &floats+1
	```

12. examine a floating point register

	```
	(gdb) print $xmm0
	(gdb) p/f $xmm0.v4_float
	(gdb) p/f $xmm0.v4_float[1]
	(lldb) po (float __attribute__((ext_vector_type(4)))) $xmm0
	```
