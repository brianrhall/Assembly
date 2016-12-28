// Program 11.1
// Arduino Due Blink Program in ARM Assembly
// Copyright (c) 2017 Hall & Slonka

void setup() {
  asm volatile(                    // same as pinMode(13, OUTPUT)
    "mov r0, %[led] \n\t"          // move I/O address to r0
    "mov r1, #1     \n\t"          // store 1 in r1
    "lsl r1, #27    \n\t"          // shift left 27 bits, mask for pin 13
    "str r1, [r0]   \n\t"          // store contents of r1 into address in r0
    : : [led] "r" (&REG_PIOB_OER)  // I/O port B enable output register
  );
}
 
void loop() {
    asm volatile(
      "push {r0-r3, lr}   \n\t"   // save registers
      "mov r0, %[ledOn]   \n\t"   
      "mov r1, #1         \n\t" 
      "lsl r1, #27        \n\t" 
      "str r1, [r0]       \n\t"   // turn LED on
      "mov r0, #1000      \n\t"   // constant parameter for delay(n)
      "bl delay           \n\t"   // branch to ARM delay(n) function
      "mov r0, %[ledOff]  \n\t"
      "mov r1, #1         \n\t"
      "lsl r1, #27        \n\t"
      "str r1, [r0]       \n\t"   // turn LED off
      "mov r0, #1000      \n\t"
      "bl delay           \n\t"
      "pop {r0-r3, lr}    \n\t"   // restore register values
      "bx lr              \n\t"   // branch to address in link register
      : : [ledOn] "r" (&REG_PIOB_SODR), [ledOff] "r" (&REG_PIOB_CODR)
    );  // SODR: set output data register; CODR: clear output data register
}

