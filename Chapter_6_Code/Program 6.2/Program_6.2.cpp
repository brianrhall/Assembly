//  Program 6.2
//  Sum Program
//  Copyright (c) 2017 Hall & Slonka

int sum(int, int);
// int __stdcall sum(int, int);
// int __fastcall sum(int, int);

int main() {
   int value1 = 2, value2 = 4, answer;
   answer = sum(value1, value2);
   return 0;
}

int sum(int value1, int value2){
   return value1 + value2;
}
