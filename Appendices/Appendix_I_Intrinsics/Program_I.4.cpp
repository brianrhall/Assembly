// Program I.4
// Add Thirty-Two Packed 8-bit Integers - C++
// Copyright (c) 2017 Hall & Slonka

#include <immintrin.h>
// also set -mavx2 compiler flag

union U32i
{
    __m256i v;
    int8_t a[32];
};

int main()
{
    U32i testing;
    
    for(int i = 0; i < 32; i++){
        testing.a[i] = i;
    }
    
    __m256i v2 = _mm256_add_epi8(testing.v, testing.v);  // VPADDB
    
    _mm256_load_si256(&v2);  // VMOVDQA
    
    return 0;  // set breakpoint here
}
