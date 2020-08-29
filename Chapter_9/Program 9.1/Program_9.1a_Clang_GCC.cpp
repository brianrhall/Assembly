// Program 9.1a
// Simple Inline Assembly - Clang/LLVM, GCC (32/64-bit)
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
using namespace std;

int main(){
   
   //accesing outside variables
   
   int var1 = 1234, var2;
   asm ("mov %1,%%eax \n\t"
        "add $2,%%eax \n\t"
        "mov %%eax,%0 \n\t"
        :"=r" (var2)       /* %0: Out */
        :"r" (var1)        /* %1: In */
        :"%eax"            /* Overwrite */
       );
   
   cout << var2 << endl;
   return 0;
}
