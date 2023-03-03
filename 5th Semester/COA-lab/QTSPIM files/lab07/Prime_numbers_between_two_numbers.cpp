#include <iostream>

using namespace std;

int main()
{
    int x,y,count;
    cout<<"please! enter first no:";
    cin>>x;
    cout<<"please! enter 2nd no:";
    cin>>y;
    cout<<"The prime numbers between "<<x<<" and "<<y<<" are: ";
    for(int i=x+1; i<y; i++) //the two inputs not involve.
    {
        count=0;
        for(int j=1; j<=i/2; j++)  //for better programming we divide up to i/2. we again get answer.
        {
            if(i%j==0)
            {
              count+=1;
            }
        }
        if(count==1)  //if we start inner for loop from 2 then count ==0
        {
            cout<<i<<" ";
        }
    }

    return 0;
}

