t = 0:0.001:1;
f1 = 80;
A1 = 0.5;
y1 = A1*sin(2*pi*f1*t);
f2 = 100;
A2 = 0.7;
y2 = A2*sin(2*pi*f2*t);
y = y1+y2;
plot(t,y)
xlabel('time in seconds');
ylabel('Amplitude');
title('Noise Signal');

figure

n=length(y);
yfft=fft(y,n);
x=(-n/2:n/2-1)*(1000*n);
yshift=fftshift(yfft);
plot(x,abs(yshift));
xlabel('Frequency in Hertz');
ylabel('Amplitude');
title('Noise Signal');
grid on