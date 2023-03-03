clc
clear all
close all
t=0:1/1000:0.25;
f1=50;
f2=120;
x=sin(2*pi*f1*t)+sin(2*pi*f2*t);
y=x+2*rand(size(t));             %noise added by standard divation of 2.
figure
plot(t,y,'r','Linewidth',2);
title('Noisy Time domain Signal');
xlabel('Time axis');
ylabel('Megnitude axis');
grid on;