// Example 9.3
// Clang/GCC Inline Assembly Dialects - Clang/LLVM, GCC (32/64-bit)
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
using namespace std;

int main(){
    
    // AT&T dialect
   asm(".att_syntax \n\t"
       "mov $5, %%eax \n\t"
       "mov $3, %%ebx \n\t"
       "add %%ebx, %%eax \n\t"
       :
       :
       : "%eax", "%ebx"
       );
   
    // Intel dialect
   asm(".intel_syntax \n\t"
       "mov eax, 5 \n\t"
       "mov ebx, 3 \n\t"
       "add eax, ebx \n\t"
       :
       :
       : "eax", "ebx"
       );
   
   return 0;
}
