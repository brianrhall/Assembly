// Program I.1
// Intrinsic Load Packed Single Precision - C++
// Copyright (c) 2017 Hall & Slonka

#include <xmmintrin.h>
int main()
{
    float array[4] = { 1.0, 2.0, 3.0, 4.0 };
    __m128 result = _mm_load_ps(array);      // MOVAPS
    
    return 0;  // set breakpoint here
}
