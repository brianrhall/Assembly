// Example 9.2
// Inline Parameter Access - Clang/LLVM, GCC (32/64-bit)
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
using namespace std;

int main(){
   
   // Example 9.2.1
   int var1 = 1234, var2;
   asm ("  mov %1, %%eax \n\t"
        "  add $2, %%eax \n\t"
        "  mov %%eax, %0 \n\t"
        : "=r" (var2)
        : "r" (var1)
        : "%eax"
        );
   cout << var2 << endl;
   
   // Example 9.2.2
   var1 = 1234;
   asm ("  mov %1, %%eax \n\t"
        "  add $2, %%eax \n\t"
        "  mov %%eax, %0 \n\t"
        : "=r" (var2)
        : "r" (var1)
        :
        );
   cout << var2 << endl;
   
   // Example 9.2.3
   var1 = 1234;
   asm ("  mov %[asm_var2], %%eax \n\t"
        "  add $2, %%eax \n\t"
        "  mov %%eax, %[asm_var1] \n\t"
        : [asm_var2] "=m" (var2)
        : [asm_var1] "m" (var1)
        : "%eax"
        );
   cout << var2 << endl;
   
   // Example 9.2.4
   var1 = 1234;
   asm ("  mov %[var2], %%eax \n\t"
        "  add $2, %%eax \n\t"
        "  mov %%eax, %[var1] \n\t"
        : [var2] "=rm" (var2)
        : [var1] "rm" (var1)
        :
        );
   cout << var2 << endl;
   
   return 0;
}
