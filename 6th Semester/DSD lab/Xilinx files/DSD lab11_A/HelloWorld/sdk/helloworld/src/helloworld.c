
#include <stdio.h>
#include "platform.h"


int main()
{
    init_platform();

    xil_printf("Hello World\n\r");

    while(1){
    	 xil_printf("Hello World\n\r");
    }

    return 0;
}
