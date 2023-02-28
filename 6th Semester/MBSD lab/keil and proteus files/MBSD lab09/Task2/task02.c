#include <reg51.h>
#include <stdio.h>
#define output P2
sbit unit=P3^0;
sbit ten=P3^1;
sbit button=P3^4;       //timer zero 

int x;
int U=0,T=0;
unsigned char out[]={ 0x40,0x79,0x24,0x30,0x19,0x12,0x02,0x78,0x00,0x10};

void init_counter()   //iniitalize counter
{
   TMOD=0x06;    //timer 0, mode 2 , 8-bits register..  we can also use 0x05  timer 0, mode 1 , 16-bits register. the rest part of the code will be same.
   TL0=0x00;      //start from 0. it will be incrementing by pressing button.
}
void start_counter()   //start counter
{
   TR0=1;
}

void main(void)
 { 
   int value=0;
    button=1;       //configure as input.
    init_counter() ;
    start_counter();
    
   while (1)
   {
      unit=1; ten=0;
      value=TL0;
      U=value%10;
      T=value/10;
      
      output=out[U];
      for(x=0; x<10000; x++);     //display unit part for some delay.
	 
      unit=0; ten=1;
      output=out[T];
      for(x=0; x<10000; x++);  //display ten part for some delay.

      if(value==100)
	 TL0=0;
   }
      
 }