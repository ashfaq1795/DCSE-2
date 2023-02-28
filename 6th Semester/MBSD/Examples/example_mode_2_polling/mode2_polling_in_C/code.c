/*generate a square wave (duty cycle 50%) of 10kHz at P1.5. use timer mode 2. the oscillator clock frequency is 18Mhz.


>>oscillator clock frequency=18Mhz so timer's clock frequency=1.5MHz,   timer clock's time period=667ns.
>>we will change oscialltor frequency menually.
>>we need a signal of frequency 10khz   time period=1/10k=100us.
>>so due to 50% duty cycle it will on for 50us and off for 50us.
>>for 50us=50us/667ns=75 cycle                    255-75=185=B4
*/


//we don't need to upload value to THx continusly 8051 give a copy of original value stored in THx to TLx after each roll over.
//also we dont need to start timer again again. just start at once.

#include <reg51.h>
#include <stdio.h>
sbit led=P1^5;

void main()
 {
   TMOD=0x20;   //mode 2  timer1
   TH1=0xB4;  //create 50 us delay if oscillator frequency=18Mhz . timer value increment after 667 nano-second.
	 //8051 give a copy of value to TLx stored in Thx after each roll over and also give a copy when we load value to THx.
   TR1=1;   //start timer only at once

   while (1)
{
     led=~led;
	   while(TF1==0);  //when roll over original value stored in THx copied to TLx.
     TF1=0;
}
      
 }