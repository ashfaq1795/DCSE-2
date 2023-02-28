#include <reg51.h>
#include <stdio.h>

sbit button=P1^0;
sbit led1=P2^1;
sbit led2=P2^2;
sbit led3=P2^3;
sbit led4=P2^4;

output=0x00;

void main(void)
{
	led1=led2=led3=led4=0;
	while(~button)   //polling
	{
			led1=1;
	    led2=1;
			led3=1;
			led4=1;	
	
	}
}