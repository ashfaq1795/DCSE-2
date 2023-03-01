clc
clear all
close all

t=0:0.01:10;
u=sin(t);
num=100;
denum=[1 4 20];
sys=tf(num,denum);
y1=lsim(sys,u,t);
y2=step(sys,0:0.01:10);
y3=step(sys,5:0.01:10);
temp=zeros(500,1);
y3=[temp;y3];
yA=y1+y2+2*y3;

sq=2*square(t);
yB=lsim(sys,sq,t);

result=yA+yB;

plot(result);


