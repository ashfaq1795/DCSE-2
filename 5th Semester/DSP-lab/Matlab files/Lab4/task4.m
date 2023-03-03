clc
clear all
close all

t = 0:0.001:1;
f1 = 80;
A1 = 0.5;
y1 = A1*sin(2*pi*f1*t);
f2 = 100;
A2 = 0.7;
y2 = A2*sin(2*pi*f2*t);
noise = y1+y2;      %noisy signal
y = 0;
for f = 10:10:60;
 y = y+sin(2*pi*f*t);   %composite signal
end
variance = y+noise;
plot(t,variance);
title('Noise plus Composite Signal');

figure
n=length(variance);
yfft=fft(variance,n);
x=(-n/2:n/2-1)*(1000*n);
yshift=fftshift(yfft);
plot(x,abs(yshift));
title('Noise plus Composite Signal');
grid on