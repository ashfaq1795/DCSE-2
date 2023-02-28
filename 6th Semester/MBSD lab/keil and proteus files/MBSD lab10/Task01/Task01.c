#include <reg51.h>
#include <stdio.h>

sbit E=P3^6;
sbit RS=P3^7;

void delay(unsigned int x)
{
   unsigned int i;
   for(i=0; i<x; i++);
}

void writedata(char u)
{
   RS=1;         //1 to select data register.
   P2=u;
   
   E=1;        //when 1  it latch information from data register to LCD.
   delay(400);
   E=0;          // LCD become clear
   delay(400);
}
void writecmd(int z)
{
   RS=0;   //RS=0 to select command register 
   P2=z;
   
   E=1;      //when 1  itlatch information from command register to LCD.
   delay(400);
   E=0;
   delay(400);
}

void lcd_init()
{
   writecmd(0x0C);  //display on,cursor off
   writecmd(0x01);  //clear display screen
   writecmd(0x06);  //increment cursor to right.
}
void name()
{
    writedata('A');
    writedata('S');
    writedata('H');
    writedata('F');
    writedata('A');
    writedata('Q');
    writedata(' ');
   writedata('A');
    writedata('H');
    writedata('M');
   writedata('A');
    writedata('D');
   writedata(' ');
   writedata('M');
    writedata('S');
    writedata('D');
}
   void microcontroller_init(void)
   {
      P1=0xf0;
      delay(200);
      P2=0x00;
      delay(200);
      P3=0x00;
      delay(200);
   }

void main(void)
 { 
	 
    microcontroller_init();
    lcd_init();
	 while(1)
	 {
    name();
	 }
 }
 
 
 
 
 
 
 
 
 