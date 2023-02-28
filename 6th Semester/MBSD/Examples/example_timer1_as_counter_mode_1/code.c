//Create an up counter using timer 1 and mode 1 that count from FF00 to FFFF.


//Note: see counter using timer 0 mode 2 in sir slide.


#include <reg51.h>
#include <stdio.h>
sbit increment_button=P3^5;  //in case of timer 1 if we use P3^4, it will not work.
//if we dont access this pin P3^5 in program and attach button to it outside still it work properly.

void start_timer()
{
TR1=1;
}
void init_timer()
{
TMOD=0x50;     //mode 1    , timer 1 as a counter
TL1=0x00;
TH1=0xFF;    //this counter wil increment from FF00 to FFFF and then start from 0000.
increment_button=1;   //set as input pin.
}        //whenever button press counter will increment automatically.

void main(void)
 { 
   init_timer();
   start_timer();
   while (1)
     {
           P1=TL1;   //display
					 P2=TH1;   //display
     }
 }
 
 //later i will add decrement button in this program also for down counter.