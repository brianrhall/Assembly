// Program 9.2a
// Floating-Point Inline Assembly - Clang/LLVM, GCC (32/64-bit)
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
using namespace std;

int main(){

float var = 0;

// x87 floating-point example
   asm("finit \n\t"
       "fldpi \n\t"
       "fsqrt \n\t"
       "fstps %[var]"
       :[var] "=m" (var)
       :
       :
      );
   
   cout << var << endl;

// SSE scalar example
   var = 1.2;
   
   asm("movss %0, %%xmm0 \n\t"
       "addss %0, %%xmm0 \n\t"
       "movss %%xmm0, %0 \n\t"
       : "+x" (var)
       :
       : "%xmm0"
   );
   
   cout << var << endl;
   
   return 0;
}
