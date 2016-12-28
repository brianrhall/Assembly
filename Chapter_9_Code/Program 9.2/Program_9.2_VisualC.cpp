// Program 9.2
// Floating-Point Inline Assembly - Visual C++ (32-bit)
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
using namespace std;

int main(){
   
   float var = 0;
   
   // x87 floating-point example
   asm{finit
       fldpi
       fsqrt
       fstp var
   };
   
   cout << var << endl;
   
   // SSE scalar example
   var = 1.2;
   
   asm{movss xmm0, var
       addss xmm0, var
       movss var, xmm0
   };
   
   cout << var << endl;
   
   return 0;
}
