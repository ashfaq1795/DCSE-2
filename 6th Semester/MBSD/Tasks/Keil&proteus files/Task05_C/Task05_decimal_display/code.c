#include <reg51.h>
#include <stdio.h>

sbit test_led=P3^1;
sbit entry_lane1=P3^2;
sbit entry_lane2=P3^3;
sbit unit1=P3^6;
sbit ten1=P3^7;
sbit unit2=P3^4;
sbit ten2=P3^5;
unsigned char arr[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};  
//{0,1,2,3,4,5,6,7,8,9} seven segemnt code in hex for active low (0). gfedcba
unsigned char u1,u2;
unsigned char t1,t2;
unsigned int count1=0;
unsigned int count2=0;

unsigned int x=0,y=0;

void timer() interrupt 3
{
	 y++;
   if(y==5000)
   {
      IE=0;
      test_led=1;
   }
   else
   {
      TH1=0xD1; //we need 60 sec delay.
      TL1=0x1F;  //after each roll over it take 0.012 sec and 0.012x5000=60 sec.
   }
}

void entry1() interrupt 0
{
	u1=count1%10;
	t1=count1/10;
  count1++;	
}
void entry2() interrupt 2
{
  u2=count2%10;
	t2=count2/10;
	count2++;
}

void strt()
{
   TR1=1;
}

void main(void)
 { 
    entry_lane1=1;   //configure as input.
    entry_lane2=1;  //configure as input.
    test_led=0;
    P1=0;
    P2=0;
    IT0=1;        //edge trigger external interrupt 0.
    IT1=1;         //edge trigger  external interrupt 1.
    IE=0x8D;     //enable EX0, EX1, ET1.
    TMOD=0x10;   //timer1 mode 1 (16 bits)
    TH1=0xD1;   
    TL1=0x1F;
    strt();
   while (1)
	 { 
			for(x=0; x<4000; x++);
			unit1=1; ten1=0;
			P1=arr[u1];

			for(x=0; x<4000; x++);
			unit1=0; ten1=1;
			P1=arr[t1];
			if(count1==100)
			count1=0;
			
			for(x=0; x<4000; x++);
			unit2=1; ten2=0;
			P2=arr[u2];

			for(x=0; x<4000; x++);
			unit2=0; ten2=1;
			P2=arr[t2];
			if(count2==4000)
			count2=0; 
		 
	 }
 }


