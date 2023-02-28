#include <reg51.h>
#include <stdio.h>

unsigned int count=0;  

void intp0() interrupt 0   //Low priority ISR
{ 
	  count--;
}

void intp1() interrupt 2  //high priority ISR
{
	  count++;
}

void main()
{
	/////////////IE////////////////
	EA=1;
	EX0=1;
	EX1=1;
	/////////////TCON/////////////
	IT0=1;   //both edge trigger.
	IT1=1;
	/////////////IP///////////////
	PX0=0;
	PX1=1;   //higher priority which is opposite to defualt priority.
	
	while(1)
	{
		P1=count;
	}
}