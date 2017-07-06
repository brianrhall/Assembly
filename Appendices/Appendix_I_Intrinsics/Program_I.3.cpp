// Program I.3
// Square Elements in result - C++
// Copyright (c) 2017 Hall & Slonka

#include <xmmintrin.h>
int main()
{
    float array[4] = { 1.0, 2.0, 3.0, 4.0 };
    __m128 result = _mm_load_ps(array);      // MOVAPS
    
    result = result * result;
    
    return 0;  // set breakpoint here
}
