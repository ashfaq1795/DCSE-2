#include <reg51.h>

int main()
{
	while(1)
	{
		P1=0x00;
		P1=0xFF;
	}
	return 0;
}