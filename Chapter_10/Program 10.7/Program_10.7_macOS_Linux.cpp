// Program 10.7
// Library and API System Calls - macOS/BSD and Linux (C++ 32/64-bit)
// Copyright (c) 2017 Hall & Slonka

#include <unistd.h>
#include <fcntl.h>

int main()
{
   const int num = 13;
   char inputFile[] = "input.txt";
   char buffer[num + 1] = {NULL};
   
   int FD = open(inputFile, O_RDONLY); //open file
   
   read(FD, buffer, num);              //read file
   
   write(STDOUT_FILENO, buffer, num);  //print to STDOUT
   
   close(FD);                          //close file
   
   return 0;
}
