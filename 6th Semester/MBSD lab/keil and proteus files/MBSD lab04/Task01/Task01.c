#include <reg51.h>   //oscillator clock frequency= 12MHz, time period=1us 
#include <stdio.h>
sbit led1=P1^0;
sbit led2=P1^1;
sbit led3=P1^2;
sbit led4=P1^3;

//we need 20ms delay in ISR
//20ms/1us=20000    and 65535-20000.
//Note: timer register value increase in each micro-second if clcok F=12Mhz. 
//so 20000 wil take 20000 us and 20000us=20ms.

int i;
void delay()
{
	TMOD=0x01;    //timer 0 of mode 16 bit
	for(i = 0; i<100; i++)
	{
		TH0 = 0xB1;   //FFFF-4C13=B1DF=45535= 20 msec
		TL0 = 0xDF;
		TR0=1;
		while(TF0 == 0);
		TF0 = 0;
		TR0 = 0;
	}
}

  
void ISR() interrupt 0
	{
		led1=~led1;
		led2=~led2;
		led3=~led3;
		led4=~led4;
		delay();	
	}
void main()
{
	IE=0x81;    //enable external interrupt 0
	IT0=1;      //edge trigger. i,e at low-to-high edge of EXT0 it go to ISR and wait there for 20ms.
	while(1)
	{
		led1=1;
		led2=0;
		led3=1;
		led4=0;
	}
}








