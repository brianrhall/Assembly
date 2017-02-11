// Chapter 1
// C++ Bubble Sort
// Copyright (c) 2017 Hall & Slonka

int main(){
   
   int  size = 5;
   int  value[5] = {3, 2, 6, 4, 1};
   int  i, tmp;
   bool swapped;
   
   do
   {
      swapped = false;
      for (i = 0; i < size - 1; i++){
         if (value[i + 1] < value[i])
         {
            tmp = value[i];
            value[i] = value[i + 1];
            value[i + 1] = tmp;
            swapped = true;
         }
      }
   }  while (swapped);

   return 0;
}
