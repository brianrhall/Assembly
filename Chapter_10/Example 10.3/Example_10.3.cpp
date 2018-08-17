// Example 10.3
// Division by Zero without Exception - C++
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
#include <string>

using namespace std;

float divide(float numerator, float denominator){
   if (denominator == 0) {
      cout << ("ERROR: Cannot divide by zero.\n");
      return 1;
   }
   else
      return numerator / denominator;
}

int main()
{
   int num1, num2;
   float quotient;
   
   cout << "Enter two numbers: ";
   cin >> num1 >> num2;
   
      quotient = divide(num1, num2);
      cout << "The quotient is: " << quotient << endl;
   
   cout << "End of the program.";
   return 0;
}
