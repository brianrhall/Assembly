// Program G.1
// CPUID Features - macOS (Clang/LLVM), Linux (GCC) - 64-bit
// Copyright (c) 2019 Hall & Slonka

// You can also use the 32-bit version on 64-bit platforms
// Note that in 64-bit, the upper 32-bits of the registers/bitsets are unused

#include <iostream>
#include <bitset>
using namespace std;

int main()
{
    bitset<64> features1;     // standard features in RDX
    bitset<64> features2;     // standard features in RCX
    bitset<64> eFeatures1;    // extended features in RBX
    bitset<64> eFeatures2;    // extended features in RDX
    
    asm ("movq $1, %%rax \n\t"                // RAX = 1
         "cpuid \n\t"                         // execute CPUID
         "movq %%rdx, %[features1] \n\t"
         "movq %%rcx, %[features2] \n\t"
         "movq $7, %%rax \n\t"                // RAX = 7
         "xorq %%rcx, %%rcx \n\t"             // RCX = 0
         "cpuid \n\t"
         "movq %%rbx, %[eFeatures1] \n\t"
         "movq $0x80000001, %%rax \n\t"       // RAX = 80000001h
         "cpuid \n\t"
         "movq %%rdx, %[eFeatures2] \n\t"
         :[features1] "=m"(features1),        // outputs
         [features2] "=m"(features2),
         [eFeatures1] "=m"(eFeatures1),
         [eFeatures2] "=m"(eFeatures2)
         :                                    // inputs
         :"rax","%rbx","%rcx","%rdx"          // clobbered registers
         );
    
    // binary output of features
    // output in reverse due to Little-Endian
    
    cout << "CPUID bits (right-to-left)\n";
    cout << "----------\n";
    cout << features1 << " - RDX bits, RAX=1\n";
    cout << features2 << " - RCX bits, RAX=1\n";
    cout << eFeatures1 << " - RBX bits, RAX=7 & RCX=0\n";
    cout << eFeatures2 << " - RDX bits, RAX=80000001h\n\n";
    
    cout << "CPU Features\n";
    cout << "------------\n";
    
    // FPU
    if (features1[0] == 1) {
        cout << "x87 FPU: Yes\n";
    }
    else {cout << "x87 FPU: No\n";}
    
    // SEP (SYSENTER/SYSEXIT)
    if (features1[11] == 1) {
        cout << "SYSENTER/SYSEXIT: Yes\n";
    }
    else {cout << "SYSENTER/SYSEXIT: No\n";}
    
    // MMX
    if (features1[23] == 1) {
        cout << "MMX: Yes\n";
    }
    else {cout << "MMX: No\n";}
    
    // SSE
    if (features1[25] == 1) {
        cout << "SSE: Yes\n";
    }
    else {cout << "SSE: No\n";}
    
    // SSE2
    if (features1[26] == 1) {
        cout << "SSE2: Yes\n";
    }
    else {cout << "SSE2: No\n";}
    
    // SSE3
    if (features2[0] == 1) {
        cout << "SSE3: Yes\n";
    }
    else {cout << "SSE3: No\n";}
    
    // SSSE3
    if (features2[9] == 1) {
        cout << "SSSE3: Yes\n";
    }
    else {cout << "SSSE3: No\n";}
    
    // FMA3
    if (features2[12] == 1) {
        cout << "FMA3: Yes\n";
    }
    else {cout << "FMA3: No\n";}
    
    // SSE4.1
    if (features2[19] == 1) {
        cout << "SSE4.1: Yes\n";
    }
    else {cout << "SSE4.1: No\n";}
    
    // SSE4.2
    if (features2[20] == 1) {
        cout << "SSE4.2: Yes\n";
    }
    else {cout << "SSE4.2: No\n";}
    
    // AVX
    if (features2[28] == 1) {
        cout << "AVX: Yes\n";
    }
    else {cout << "AVX: No\n";}
    
    // F16C (half-precision)
    if (features2[29] == 1) {
        cout << "F16C: Yes\n";
    }
    else {cout << "F16C: No\n";}
    
    // RDRAND (random number generator)
    if (features2[30] == 1) {
        cout << "RDRAND: Yes\n";
    }
    else {cout << "RDRAND: No\n";}
    
    cout << "\n";
    
    cout << "Extended Features\n";
    cout << "-----------------\n";
    
    // AVX2
    if (eFeatures1[5] == 1) {
        cout << "AVX2: Yes\n";
    }
    else {cout << "AVX2: No\n";}
    
    // AVX512f
    if (eFeatures1[16] == 1) {
        cout << "AVX512f: Yes\n";
    }
    else {cout << "AVX512f: No\n";}
    
    // AVX512dq
    if (eFeatures1[17] == 1) {
        cout << "AVX512dq: Yes\n";
    }
    else {cout << "AVX512dq: No\n";}
    
    // RDSEED
    if (eFeatures1[18] == 1) {
        cout << "RDSEED: Yes\n";
    }
    else {cout << "RDSEED: No\n";}
    
    // AVX512ifma
    if (eFeatures1[21] == 1) {
        cout << "AVX512ifma: Yes\n";
    }
    else {cout << "AVX512ifma: No\n";}
    
    cout << "\n";
    
    cout << "More Extended Features\n";
    cout << "----------------------\n";
    
    // SYSCALL/SYSRET
    if (eFeatures2[11] == 1) {
        cout << "SYSCALL/SYSRET: Yes\n";
    }
    else {cout << "SYSCALL/SYSRET: No\n";}
    
    return 0;
}
