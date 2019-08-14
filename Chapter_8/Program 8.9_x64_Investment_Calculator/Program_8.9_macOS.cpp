// Program 8.9
// macOS (Xcode) C++ Code
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
#include <iomanip>

extern "C" void asmMain();

extern "C" void printString(char* s){
   std::cout << s;
   return;
}

extern "C" void printDouble(double d){
   std::cout.setf(std::ios::fixed);
   std::cout.setf(std::ios::showpoint);
   std::cout.precision(2);
   std::cout << d << std::endl;
   return;
}

extern "C" double getDouble(){
   double d;
   std::cin >> d;
   return d;
}

extern "C" int getInt(){
   int i;
   std::cin >> i;
   return i;
}

// main stub driver
int main(){
   asmMain();
   return 0;
}
