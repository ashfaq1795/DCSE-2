//generate a square wave (duty cycle 50%) of 13kHz at P1.5. use timer mode 2. the oscillator clock frequency is 15Mhz.

/*
>>oscillator clock frequency=15Mhz so timer's clock frequency=1.25MHz,   timer clock's time period=800ns.
>>we will change oscialltor frequency menually.
>>we need a signal of frequency 13khz   time period=1/13k=77us.
>>so it will on for 38.5us and off for 38.5us.
>>for 38.5us=38.5us/800ns=48 cycle required  to give 38.5 ms delay if oscillator frequency= 15Mhz.
>>FF-CF=48 cycle

*/
#include <reg51.h>
#include <std.h>

sbit led=P1^1;

void init_timer1()
{
	TMOD=0x20;     //timer 1 mode 2  autoreload mode
	TH1=0xCF;      //it give a copy to TL1 and starts increment when TR1 is set to 1 and after each roll over it again give a copy 
	               //of CF to TL1 and control  go to ISR. there complement the signal and again timer incrementing and so on.
	IE=0x88;    //enable EA bit and ET1.
}
void start_timer1()
{
	TR1=1;
}
void ISR_timer1() interrupt 3
{
	led^=1;    //xor operation.
}

void main()
{
	init_timer1();
	start_timer1();
	
	while(1)
        { 
             //after timer start control will busy in while loop while timer register also incrementing parallely.
             //whenever roll over occur TL1 will loaded again automatically due to autoreload mode andcontrol will move to ISR, while loop will stop and in ISR 
              //signal will become toggled then control will come back to while loop and timer register will again start
             //incrementing parallely and so on.
 
            //we can also do any other operation paralley with timer register incrementation. but in interrupt case it will block.  
       } 
	
}
	

//in interrupt case for both mode 1 and mode 2 we initialize TMOD and TRx at once.	