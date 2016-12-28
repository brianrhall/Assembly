// Assignments 8.1 and 8.2
// Mac (Xcode) C++ Code
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
using namespace std;

extern "C" void asmMain();

extern "C" double getDouble(){
    double d;
    std::cin >> d;
    return d;
}

extern "C" void printString(char* s){
    std::cout << s;
    return;
}

extern "C" void printDouble(double d){
    cout << d << endl;
}

// main stub driver
int main(){
    asmMain();
    return 0;
}
