clc
clear all
close all
t=0:1/1000:0.25;
f1=50;
f2=120;
x=sin(2*pi*f1*t)+sin(2*pi*f2*t);  %noiseless
plot(t,x,'r','Linewidth',2);
title('Noiseless Time domain Signal');
xlabel('Time axis');
ylabel('Megnitude axis');
grid on;



