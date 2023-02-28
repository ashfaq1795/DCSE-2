#include <reg51.h>
#include <stdio.h>
sbit signal=P1^1;
sbit button=P1^2;
unsigned int i;
void Delay(int TH0_reg,int TL0_reg )  //give 1.085 micro sec delay.
{ 
   TMOD=01;
   TH0=TH0_reg;
	 TL0=TL0_reg;
   TR0=1;
   while(TF0==0);
      TR0=0;
      TF0=0; 
}
void main()
 { 
    int count=0;
    button=1;
    while(1)
    {    
  if(button==0)
  {
     count++;
  }
  if(count%4==0)
  {
     signal=1;
     Delay(0xDB,0xFE);    //10msec
     signal=0;
		for(i=1; i<10; i++)
     Delay(0xDB,0xFE);     //10x9=90 msec
  }
  if(count%4==1)
  {
     signal=1;
     Delay(0xDB,0xFE);  //10 msec
     signal=0;
     Delay(0x6F,0xFD);    //40 msec
  }
  if(count%4==2)
  {
     signal=1;
     Delay(0xDB,0xFE);  //10 msec
     signal=0;
     Delay(0xC9,0xFF);   //15 msec
  }
  if(count%4==3)
  {
     signal=1;
     Delay(0xDB,0xFE);  //10 msec
     signal=0;
     Delay(0xF6,0xFF);  //2.5 msec
  }
 }
}
