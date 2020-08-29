// Program 9.1a
// Simple Inline Assembly - Visual C++ (32-bit)
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
using namespace std;

int main(){
   
   int var1 = 1234, var2;
   
   __asm {mov eax, var1
          add eax, 2
          mov var2, eax
   }
   
   cout << var2 << endl;
   return 0;
}
