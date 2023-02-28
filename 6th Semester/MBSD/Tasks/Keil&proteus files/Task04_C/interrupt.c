#include <reg51.h>
#include <stdio.h>
sbit signal=P2^0;
sbit button=P3^2;
unsigned int count=0;
void delay(unsigned char th0,unsigned char tl0)
{
	TMOD=0x01;
	TH0=th0;
	TL0=tl0;
	TR0=1;
	while (TF0==0);
	TF0=0;
	TR0=0;	
}
void ISR() interrupt 0
{
	 count=count+1;
}

void main()
{
	IE=0x81; //EA=1 and EX0=1;
	IT0=1;  
	signal=1;  //make input pin.
	button=1; //initially button not pressed.
  while(1)
	{		
 if(count%3==0)
 {

		  signal=1;
	    delay(0xFC,0x18);  //0.5 ms
		  signal=0;
		  delay(0xF4,0x48);  //1.5 ms
 }
 else
 if(count%3==1)
 {
	
		  signal=1;
	    delay(0xFC,0x18);   //0.5 ms
		  signal=0;
		  delay(0xFC,0x18);   //0.5 ms
 }
 else
 if(count%3==2)
 {
		  signal=1;
	    delay(0xFD,0x12);  //0.375 ms
		  signal=0;
		  delay(0xFF,0x06);  //0.125 ms
	 
 }	
	}
}






