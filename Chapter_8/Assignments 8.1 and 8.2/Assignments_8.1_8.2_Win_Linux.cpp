// Assignments 8.1 and 8.2
// Windows (Visual Studio) and Linux (g++) C++ Code
// Copyright (c) 2017 Hall & Slonka

#include <iostream>

extern "C" void _asmMain();

extern "C" double _getDouble() {
    double d;
    std::cin >> d;
    return d;
}

extern "C" void _printString(char* s) {
    std::cout << s;
    return;
}

extern "C" void _printDouble(double d) {
    std::cout << d << std::endl;
}

// main stub driver
int main() {
    _asmMain();
    return 0;
}
