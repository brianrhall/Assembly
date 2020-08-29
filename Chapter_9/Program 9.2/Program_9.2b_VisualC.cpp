// Program 9.2b
// Floating-Point Intrinsics - Visual C++ (32/64-bit)
// Copyright (c) 2020 Hall & Slonka

#include <intrin.h>
#include <iostream>
using namespace std;

const double PI = 3.14159265358979323846;

union S64d {
    __m128d v;
    double_t dubs[2];
};

int main() {
    
    S64d PIES;
    
    PIES.v = _mm_load1_pd(&PI);
    PIES.v = _mm_sqrt_sd(PIES.v, PIES.v);
    
    cout << PIES.dubs[0] << endl;
    
    return 0;
}
