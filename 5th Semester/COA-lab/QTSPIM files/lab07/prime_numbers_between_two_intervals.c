#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x,y,c;
    printf("please! enter first no:");
    scanf("%d",&x);
    printf("please! enter 2nd no:");
    scanf("%d",&y);
    printf("The prime numbers between %d and %d including these boundaries are: ",x,y);
    for(int i=x; i<=y; i++)
    {
        int count=0;
        for(int j=1; j<=i/2; j++)
        {
            c=i%j;
            if(c==0)
            {
                count+=1;
            }
        }
        if(count==1)
        {
            printf("%d ",i);
        }
    }

    return 0;
}
