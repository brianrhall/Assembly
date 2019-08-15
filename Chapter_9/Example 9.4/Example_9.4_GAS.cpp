// Example 9.4
// Multiple Dialects in Clang/GCC - Clang/LLVM, GCC (32/64-bit)
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
using namespace std;

int main(){

   asm(
       "mov{l $5, %%ebx | ebx, 5} \n\t"
       "mov{l $3, %%ecx | ecx, 3} \n\t"
       "xchg{l}\t {%%}ebx,\t {%%}ecx \n\t"
       :
       :
       :
      );
   
   return 0;
}
