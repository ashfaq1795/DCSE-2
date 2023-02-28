#include<reg51.h>
#include<stdio.h>
unsigned int y;
void main(void)
{
    TMOD =0x20;
    TH1 =0xFD; // bps 9600
    SCON =0x50;
    PCON =0x00;
    TR1 =1;
    while (1)
    {
        while (RI ==0)
            ; // Stays here until the Data is received
        RI =0;
        P1 = SBUF; // Throws the output data to P1
    }
}
