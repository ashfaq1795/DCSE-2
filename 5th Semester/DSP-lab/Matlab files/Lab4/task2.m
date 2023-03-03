clc
clear
close all
y=0;
for f = 10:10:60
 t = 0:0.001:1;
 y = y+sin(2*pi*f*t);
end
 plot(t,y)
 xlabel('time in seconds');
 ylabel('Amplitude');
 title('Composite (Voice) signal ');
 
figure
Y =fft(y,length(y));
n = length(Y);
fshift = (-n/2:n/2-1)*(1000*n);
Yshift = (fftshift(Y));
plot(fshift,abs(Yshift));
title('Frequency Response of composite Signal');
