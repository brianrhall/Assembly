// Program 9.2b
// Floating-Point Intrinsics - Clang/LLVM, GCC (32/64-bit)
// Copyright (c) 2020 Hall & Slonka

#include <x86intrin.h>
#include <iostream>
#include <math.h>
using namespace std;

int main(){
    
    // square root of PI example
    const double PI = M_PI;                 // needs to be a const double
    const double* ptr_PI = &PI;             // get the address of PI
    __m128d vecPI = _mm_load_sd(ptr_PI);    // load PI into a vector
    __m128d sqrtPI = _mm_sqrt_pd(vecPI);    // get square root
    cout << sqrtPI[0] << endl;

    // SSE scalar example, adding a scalar value to itself
    float var = 1.2;
    float* ptr_var = &var;
    __m128 varVec = _mm_load_ss(ptr_var);
    varVec = _mm_add_ss(varVec, varVec);
    cout << varVec[0];
    
    return 0;
}
