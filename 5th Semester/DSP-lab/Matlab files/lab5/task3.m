clc
clear all
close all
t=0:1/1000:0.25; %sampling rate 1000 per second
f1=50;
f2=120;
x=sin(2*pi*f1*t)+sin(2*pi*f2*t); %composite signal
y=x+rand(size(t));              %noisy signal
n=length(y);
yfft=fft(y,n);            %fast fourier transform
fshift=(-n/2:n/2-1)*(1000/n); %frequency x-axis
yshift=(fftshift(yfft));  
%FFTSHIFT is useful for visualizing the Fourier transform with
%the zero-frequency component in the middle of the spectrum.
plot(fshift,abs(yshift),'r','Linewidth',2);
title('Noisy Frequency domain Signal');
xlabel('Time axis');
ylabel('Megnitude axis');
grid on;