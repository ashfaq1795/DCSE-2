#include <reg51.h>
#include <stdio.h>
#define seven_seg P2

sbit Unit=P3^0;
sbit Ten=P3^1;

unsigned int count=0;
int u=0;
int t=0;
int x;
unsigned char ch[]={0x40,0x79,0x24,0x30,0x19,0x12,0x02,0x78,0x00,0x10};   
//{0,1,2,3,4,5,6,7,8,9} seven segemnt code in hex for active low (0).


void main(void)
 { 
   while (1)
   {
      Unit=1;Ten=0;   //we can't use both seven segment at a time.
      u=count%10;
      t=count/10;
      seven_seg=ch[u];
      
      for(x=0; x<20000; x++);
      
      Unit=0; Ten=1;
      seven_seg=ch[t];
      
      for(x=0; x<20000; x++);
       count++;
      if(count==100)
      count=0;
   }
      
 }