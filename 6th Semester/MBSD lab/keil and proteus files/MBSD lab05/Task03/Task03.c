#include <reg51.h>
#include <stdio.h>
int Array[10] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int cnt,num,temp,i;
void Delay(unsigned int time)
{
		 unsigned int x,y;
		 for(x = 0;x<time;x++)
		 for(y = 0;y<123;y++);
}
void main(void)
{ 
		 while (1)
		 {
			 for (cnt = 0; cnt <= 9999; cnt++) 
			 {
					 for (i = 0; i < 20; i++)
					 {
								 num = cnt;
								 temp = num / 1000;
								 num = num % 1000;
								 P3 = 0xFE; 
								 P2 = Array[temp]; 
								 Delay(1);
								 temp = num / 100;
								 num = num % 100;
								 P3 = 0xFD; 
								 P2 = Array[temp];
								 Delay(1);
								 temp = num / 10;
								 P3 = 0xFB;
								 P2 = Array[temp];
								 Delay(1);
								 temp = num % 10;
								 P3 = 0xF7;
								 P2 = Array[temp];
								 Delay(8); 
					 }
			 }
		 }
}
