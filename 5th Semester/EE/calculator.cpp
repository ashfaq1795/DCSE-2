#include <iostream>
#include <cmath>
using namespace std;

class calculator
{
	public:
	    void single_payment(float i,int n);
	    void uneven_payment(float i,int n);
	    void uniform_payment(float i,int n);
	    void Gradient_payment(float i,int n);
};

void calculator::single_payment(float i,int n)
{
    float condition,PW=0,FW=0;
    cout<<"\n1.FW given PW\n";
    cout<<"2.PW given FW\n";

    cout<<"\nPlease! select the menu: ";
    cin>>condition;
    if(condition==1)  //present worth
    {
        cout<<"Please! Enter PW: ";
        cin>>PW;
        FW=PW*pow(1+i,n);
        cout<<"The Future Worth FW is: "<<FW<<endl;
    }
    else if(condition==2)
    {
        cout<<"Please! Enter FW: ";
        cin>>FW;
        float a=pow(1+i,n);
        float b=1/a;
        PW=FW*b;
        cout<<"The present Worth PW is: "<<PW<<endl;
    }
    else
        cout<<"sorry! invalid input";
}


void calculator::uneven_payment(float i,int n)
{
    float condition,PW=0,FW=0;
    float payment[n];
    cout<<"Please! Enter the amount of uneven payments.\n";
    cout<<"the year in which no payment occur please enter 0 there.\n";
    for(int b=1; b<=n; b++)
    {
        cout<<"Year "<<b<<": ";
        cin>>payment[b];
    }
    cout<<"\n1.PW given uneven payment\n";
    cout<<"2.FW given uneven payment\n";

    cout<<"\nPlease! Select menu: ";
    cin>>condition;
    if(condition==1)
    {
        for(int b=1; b<=n; b++)
        {
            float a=0,d=0,c=0;
            a=pow(1+i,b);
            d=1/a;
            c=payment[b]*d;
            PW=PW+c;
        }
        cout<<"The present worth of given Uneven payment is: "<<PW<<endl;
    }
    else if(condition==2)
    {
        int x=n-1,b;
        for(b=1; b<=n; b++)
        {
            float a=0,c=0;
            a=pow(1+i,x);
            c=payment[b]*a;
            FW=FW+c;
            x--;
        }
        cout<<"The Future worth of given Uneven payment is: "<<FW<<endl;
    }
    else
        cout<<"Sorry! Invalid input";
}

void calculator::uniform_payment(float i,int n)
{
    float condition,PW=0,FW=0,AW=0;
    cout<<"1. FW given AW\n";
    cout<<"2. PW given AW\n";
    cout<<"3. AW given PW\n";
    cout<<"4. AW given FW\n";
    cout<<"\nPlease! select the menu: ";
    cin>>condition;
    if(condition==1)
    {
        cout<<"please! Enter AW: ";
        cin>>AW;
        float a=pow(1+i,n);
        float b=(a-1)/i;
        FW=AW*b;
        cout<<"The Future Worth given Annuity: "<<FW<<endl;
    }
    else if(condition==2)
    {
        cout<<"please! Enter AW: ";
        cin>>AW;
        float a=pow(1+i,n);
        float b=i*a;
        float c=(a-1)/b;
        PW=AW*c;
        cout<<"The Present Worth given Annuity: "<<PW<<endl;
    }
    else if(condition==3)
    {
        cout<<"Please! Enter Present Worth: ";
        cin>>PW;
        float a=pow(1+i,n);
        float b=i*a;
        float c=b/(a-1);
        AW=PW*c;
        cout<<"The Annuity given present worth is: "<<AW<<endl;
    }
    else if(condition==4)
    {
        cout<<"Please! Enter Future Worth: ";
        cin>>FW;
        float a=pow(1+i,n);
        float b=i/(a-1);
        AW=FW*b;
        cout<<"The Annuity worth given Future Worth is: "<<AW<<endl;
    }
    else
        cout<<"Sorry! Invalid input";
}

void calculator::Gradient_payment(float i,int n)
{
    float condition,PW=0,FW=0,AW=0,GW=0;
    cout<<"\n1. FW given GW\n";
    cout<<"2. GW given FW\n";
    cout<<"3. PW given GW\n";
    cout<<"4. GW given PW\n";
    cout<<"5. AW given GW\n";
    cout<<"6. GW given AW\n";
    cout<<"\nPlease! select the menu: ";
    cin>>condition;

    if(condition==1)
    {
        cout<<"Please! Enter GW: ";
        cin>>GW;
        float a=pow(1+i,n);
        float b=a/(i*i);
        float c=n/i;
        float d=b-c;
        FW=GW*d;
        cout<<"Future Worth Given gradient is: "<<FW<<endl;
    }
    else if(condition==2)
    {
        cout<<"Please! Enter FW: ";
        cin>>FW;
        float a=pow(1+i,n);
        float b=(i*i);
        float c=a-1-(n*i);
        float d=b/c;
        GW=FW*d;
        cout<<"Gradient Worth Given Future worth is: "<<GW<<endl;
    }
    else if(condition==3)
    {
       cout<<"Please! Enter GW: ";
        cin>>GW;
        float a=pow(1+i,n);
        float b=(i*i);
        float c=a-1-(n*i);
        float d=c/(b*a);
        PW=GW*d;
        cout<<"Present Worth Given Gradient worth is: "<<PW<<endl;
    }
    else if(condition==4)
    {
       cout<<"Please! Enter PW: ";
        cin>>PW;
        float a=pow(1+i,n);
        float b=(i*i);
        float c=a-1-(n*i);
        float d=(b*a)/c;
        GW=PW*d;
        cout<<"Gradient worth given Present Worth is: "<<GW<<endl;
    }
    else if(condition==5)
    {
       cout<<"Please! Enter GW: ";
        cin>>GW;
        float a=pow(1+i,n);
        float b=a-1;
        float c=n/b;
        float d=1/i;
        float e=d-c;
        AW=GW*e;
        cout<<"Annuity given Gradient Worth is: "<<AW<<endl;
    }
    else if(condition==6)
    {
       cout<<"Please! Enter AW: ";
        cin>>AW;
        float a=pow(1+i,n);
        float b=(a-1)*i;
        float c=a-(n*i);
        float d=b/c;
        GW=AW*d;
        cout<<"Gradient given Annuity Worth is: "<<GW<<endl;
    }
    else
        cout<<"sorry! Invalid input";

}


int main()
{
    calculator p;
    float i;
    int n,x;
    cout<<"Please! Enter interest rate in percent: ";
    cin>>i;
    i=i/100;
    cout<<"Please! Enter Interval: ";
    cin>>n;
    cout<<endl;

    cout<<"1.Single payment series\n";
    cout<<"2.Uneven payment series\n";
    cout<<"3.Uniform payment series\n";
    cout<<"4.Gradient payment series\n";

    cout<<"\nPlease! select the menu: ";
    cin>>x;
    if(x==1)
    {
        p.single_payment(i,n);
    }
    else if(x==2)
    {
       p.uneven_payment(i,n);
    }
    else if(x==3)
    {
        p.uniform_payment(i,n);
    }
    else if(x==4)
    {
        p.Gradient_payment(i,n);
    }
    else
        cout<<"Sorry! Invalid Input";

    return 0;
}





