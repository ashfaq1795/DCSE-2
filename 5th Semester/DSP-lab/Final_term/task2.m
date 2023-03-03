clc 
clear all
close all
fs=1000;
f=150;
time=50;
t=0:1/fs:time;
y=sin(2*pi*f*t);
Y=fft(y);
n=length(y);
ts=1/fs;
f=(0:(n-1)*(ts/n));
decibel=10*log(f);
plot(f,Y,'r');
xlabel('x-axis');
ylabel('y-axis');
title('default frequency');



