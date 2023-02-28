#include <reg51.h>
#include <stdio.h>
sbit c1=P1^0;
sbit c2=P1^1;
sbit c3=P1^2;
sbit r1=P1^3;
sbit r2=P1^4;
sbit r3=P1^5;
sbit r4=P1^6;


void main()
{	
	P2=0xFF;  //active low
	r1=r2=r3=r4=1;
	r1=0;
		if(c1==0)
		{
			P2=0xF9;  //11111001
		}
		else if(c2==0)
		{
			P2=0xA4;
		}
		else if(c3==0)
		{
			P2=0xB0;
		}
	
	r1=r3=r4=1;
	r2=0;
		if(c1==0)
		{
			P2=0x99;
		}
		else if(c2==0)
		{
			P2=0x92;
		}
		else if(c3==0)
		{
			P2=0x82;
		}
	
	r3=0;
	r1=r2=r4=1;
		if(c1==0)
		{
			P2=0xF8;
		}
		else if(c2==0)
		{
			P2=0x80;
		}
		else if(c3==0)
		{
			P2=0x90;
		}
	r4=0;
	r1=r2=r3=1;
		if(c2==0)
		{
			P2=0xC0;
		}
}