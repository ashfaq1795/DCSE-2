//generate a square wave at P1.5 having pulse time period 200 us using timer mode 1. the oscillator clock frequency is 12Mhz.



//external oscillator=12Mhz,   clock frequency=1Mhz, clock Time period=1us
//so for 200us=200us/1us=200 clock cycle required for 200us delay.
//FFFF-200=FF38.



#include <reg51.h>
#include <stdio.h>
sbit led=P1^5;

void delay(int HB,int LB)
{
TL0=LB;      //as timer mode 1 is not autoreload so we are putting values continusly.
TH0=HB;
while(TF0==0);
TF0=0;
}

void main()
{ 
   TMOD=0x01;   //timer0 mode 1
   TR0=1;
   while (1)
{
     delay(0xFF,0x38);  //FFFF-FF38=199+1 roll over=200 cycle.
     led=~led;
}      
}

//it is not giving exact delay because while loop and assigning to TH0 and TL0 also execuitng it also take some time.
//if i put FFFF-188=FF43. it give exact delay.


/*Note: 
  Assign to THx or TLx is equal to Mov command which takes two cycle
  while loop is equal to JNB so it take one cycle each time. and so on.
*/
 