// Program 10.7
// Library and API System Calls - Windows (C++ 32/64-bit)
// Copyright (c) 2017 Hall & Slonka
// Note: In Project Properies select
// General->Advanced->Character Set to Use Multi-Byte Character Set

#include <Windows.h>

using namespace std;

int main()
{
   const int num = 13;
   char inputFile[] = "input.txt";
   char caption[] = "Message";
   char buffer[num + 1] = {NULL};
   DWORD charsRead = 0;
   
   HANDLE FD = CreateFile(inputFile,               // open inputFile.txt
                          GENERIC_READ,            // open for reading
                          0,                       // do not share
                          NULL,                    // default security
                          OPEN_EXISTING,           // existing file only
                          FILE_ATTRIBUTE_NORMAL,   // normal file
                          NULL);                   // no attribute template
   
   bool read = ReadFile(FD, buffer, num, &charsRead, NULL);	// read file
   
   int button = MessageBox(0, buffer, caption, MB_OK);		// write message
   
   bool closed = CloseHandle(FD);                           //close file
   
   return 0;
}
