// Program 9.1b
// Simple Intrinsics - Visual C++ (32/64-bit)
// Copyright (c) 2020 Hall & Slonka

#include <intrin.h>
#include <iostream>
using namespace std;

int main()
{
    __m128i var1 = _mm_cvtsi32_si128(1234);
    __m128i var2 = _mm_cvtsi32_si128(2);

    var1 = _mm_add_epi64(var1, var2);

    int output = _mm_cvtsi128_si32(var1);

    cout << output << endl;
    return 0;
}
