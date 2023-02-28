#include <reg51.h>
#include <stdio.h>

unsigned int count=0;
void intp0() interrupt 1
{
     count++;
}
void intp1() interrupt 2
{
    count--;
}


void main(void)
 { 
   P3 |=0x0c; //set Pin 2 and 3 as input. if we don't set these pin as input, still it will work. 
   EX0=1;   //enable external interrupt 0
   EX1=1;   //enable external interrupt 1
   EA=1;    //enable all interrupts.
   IT0=1;   //set interrupt 0 as edge trigger 
   IT1=0;   //set interrupt 1 as a level trigger.
   while (1)
      {
          P1=count;
       }
 }