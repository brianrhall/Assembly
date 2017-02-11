// Example 10.4
// Division by Zero with Exception - C++
// Copyright (c) 2017 Hall & Slonka

#include <iostream>
#include <string>

using namespace std;

double divide(double numerator, double denominator){
   if (denominator == 0) {
      throw string("ERROR: Cannot divide by zero.\n");
   }
   else
      return numerator / denominator;
}

int main()
{
   int num1, num2;
   double quotient;
   
   cout << "Enter two numbers: ";
   cin >> num1 >> num2;
   
   try {
      quotient = divide(num1, num2);
      cout << "The quotient is: " << quotient << endl;
   }
   catch (string exceptionString) {
      cout << exceptionString;
   }
   
   cout << "End of the program.";
   return 0;
}
