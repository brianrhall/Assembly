// Program 9.1b
// Simple Intrinsics - Clang/LLVM, GCC (32/64-bit)
// Copyright (c) 2020 Hall & Slonka

#include <x86intrin.h>
#include <iostream>
using namespace std;

int main()
{
    __m64 var1 = _mm_cvtsi32_si64(1234);
    __m64 var2 = _mm_cvtsi32_si64(2);

    var1 = _mm_add_pi32(var1, var2);

    cout << var1[0] << endl;
    return 0;
}
