#include <reg51.h>
#include <stdio.h>

sbit hp_sig=P2^0;
sbit lp_sig=P2^1;

void low_priority() interrupt 1
{
	lp_sig=~lp_sig;
}
void high_priority() interrupt 3
{
	hp_sig=~hp_sig;
}
void main()
{
TMOD=0x22;  //both timer 0 and 1 mode 2 (auto-Reload) 
IE=0x8A;
TH0=0x3D;  //195 usec delay .
TH1=0x3D;
TR0=1;    //start timer0
TR1=1;     //start timer 1
PT0=0;     //by default timer0_interrupt has high priorty than timer1_interrupt but
PT1=1;    //here Timer1_interrupt has higher priority than Timer0_interrupt.
while(1);
}
