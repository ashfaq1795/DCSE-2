clc
clear all
close all
t=0:0.01:10;
u=sin(t);
num=100;
denum=[1 4 20];
sys=tf(num,denum);
y1=lsim(sys,u,t);   %sin response
y2=step(sys,0:0.01:10); %unit step response
y3=step(sys,5:0.01:10); %unit step response
temp=zeros(500,1);  
y3=[temp;y3];   %b/c the size of y3 become = to y1 and y2.
y=y1+y2+2*y3;
plot(y);
