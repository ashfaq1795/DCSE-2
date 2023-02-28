//generate a square wave at P1.1 having pulse time period  5 msec using timer mode 1. the oscillator clock frequency is 12Mhz. use timer interrupt.

//for 5ms=5ms/1us=5000 clock cycle required to generate 5ms delay if oscillator F=12Mhz.
//FFFF-EC77=5000. we will put EC77

#include <reg51.h>
#include <stdio.h>

sbit led=P1^1;

void timer0() interrupt 1  //ISR    1 mean timer 0 interrupt. 
{
		led=~led;
		TL0=0x77;    //not autoreload mode.
		TH0=0xEC;
}

//whenever TL0 and TH0 roll over control move to interrupt service routine (timer0() interrupt 1) and there signal become toggled 
//and TL0 and TH0 again loaded. after loading, TL0 and TH0 again start incrementing as we have already started Timer at once (TR0=1).

void init_timer()
{
     TMOD=0x01;         // timer 0       mode 1
     TL0=0x77;
     TH0=0xEC;        //5 ms delay.  whenever timer register roll over it will go to ISR.
     IE=0x82;       //enable EA bit and enable ET0 (enable timer 0 interrupt).
}

void main(void)
 { 
  init_timer();
  TR0=1;        //timer start. 
  while (1)
  { 
             //after timer start control will busy in while loop while timer register also incrementing parallely.
             //whenever roll over occur control will move to ISR while loop will stop and in ISR timer register will
             //loaded again and signal will become toggled then control will come back to while loop and timer register will again start
             //incrementing parallely and so on.
 
      //we can also do any other operation paralley with timer register incrementation. but in interrupt case it will block.  
   }   
 }
 
 
 
 
 //in interrupt case for both mode 1 and mode 2 we initialize TMOD and TRx at once.
 
 
 
 
 