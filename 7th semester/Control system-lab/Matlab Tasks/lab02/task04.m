clc
clear all
close all
t=0:0.01:40;
sq=2*square(t);
num=100;
denum=[1,4,20];
sys=tf(num,denum);
y=lsim(sys,sq,t);
plot(y);