clc
clear all
close all
t=0:0.001:1;
for f=10:10:60;
y=sin(2*pi*f*t);
subplot(3,2,f/10)
plot(t,y)
xlabel('time domain');
ylabel('Amplitude');
title(f);
end

figure
for f=10:10:60;
y=sin(2*pi*f*t);
n=length(y);
yfft=fft(y,n)
x = (-n/2:n/2-1)*(1000*n);  %x-axis
Yshift = (fftshift(yfft));
subplot(3,2,f/10)
plot(x,abs(Yshift))
xlabel('frequency domain');
ylabel('Amplitude');
title(f);
end


