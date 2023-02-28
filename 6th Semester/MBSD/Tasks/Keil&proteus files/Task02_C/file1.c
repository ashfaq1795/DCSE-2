#include <reg51.h>
#include <stdio.h>

sbit pin=P1^2;
sbit button=P1^1;
	
	void mysig(unsigned int msec)
	{
	     unsigned int j,k;
		for( j=0; j<msec; j++)
		 {
		for( k=0; k<125; k ++);  //create 1msec delay when frequency of MC is 12MH.
		 }
		
	}
void  main()
   { 
while(1)
	  { 
	  if(button)
		  {
		  pin=1;
		  mysig(2);
		  pin=0;
		  mysig(3);
		 }
		else
       pin=1;
       mysig(6);
       pin=0;
       mysig(4);
   }
 }
