// Program G.1
// CPUID Features - macOS (Clang/LLVM), Linux (GCC) - 32-bit
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
#include <bitset>
using namespace std;

int main()
{
   bitset<32> features1;     // standard features in EDX
   bitset<32> features2;     // standard features in ECX
   bitset<32> eFeatures1;    // extended features in EBX
   bitset<32> eFeatures2;    // extended features in EDX
   
   asm ("movl $1, %%eax \n\t"                // EAX = 1
        "cpuid \n\t"                         // execute CPUID
        "movl %%edx, %[features1] \n\t"
        "movl %%ecx, %[features2] \n\t"
        "movl $7, %%eax \n\t"                // EAX = 7
        "xorl %%ecx, %%ecx \n\t"             // ECX = 0
        "cpuid \n\t"
        "movl %%ebx, %[eFeatures1] \n\t"
        "movl $0x80000001, %%eax \n\t"        // EAX = 80000001h
        "cpuid \n\t"
        "movl %%edx, %[eFeatures2] \n\t"
        :[features1] "=m"(features1),        // outputs
         [features2] "=m"(features2),
         [eFeatures1] "=m"(eFeatures1),
         [eFeatures2] "=m"(eFeatures2)
        :                                    // inputs
        :"eax","%ebx","%ecx","%edx"          // clobbered registers
       );
   
   // binary output of features
   // output in reverse due to Little-Endian
   
   cout << "CPUID bits (right-to-left)\n";
   cout << "----------\n";
   cout << features1 << " - EDX bits, EAX=1\n";
   cout << features2 << " - ECX bits, EAX=1\n";
   cout << eFeatures1 << " - EBX bits, EAX=7 & ECX=0\n";
   cout << eFeatures2 << " - EDX bits, EAX=80000001h\n\n";
   
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
