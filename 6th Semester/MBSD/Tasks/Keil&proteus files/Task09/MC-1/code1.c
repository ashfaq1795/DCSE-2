#include<reg51.h>
#include<stdio.h>
#define input P1;
doubleDG_signal;
// ADC pins
sbit Read = P3 ^3;  // rd pin will use for reading
sbit Write = P3 ^4; // wr pin will use for writing
sbit INTR = P3 ^2;  // intr is used for interrupt
void Analogue_to_digital()
{
    Read =1;  // high to low to read from adc
    Write =0; // low to high to write on adc
    // delay(1);
    Write =1;
    while (INTR ==1)
        ; // low active interrupt
    Read =0;
}
voidmain(void)   //microcontroller configuration
{
    TMOD =0x20; // Auto Reload Mode of Timer1
    TH1 =0xFD;
    SCON =0x50;   //SM1=1 REN=1;
    PCON =0x00;    //bps not twice
    TR1 =1; // Set TImer1
    while (1)
    {
        Analogue_to_digital();
        SBUF =input; // reg for serial communication
        while (TI ==0)
            ; /// when the transmission done the T1==0
        TI =0;
    }
}
