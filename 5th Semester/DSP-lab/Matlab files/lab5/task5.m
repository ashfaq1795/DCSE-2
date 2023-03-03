clc
clear all
close all
fs = 1000;
t = 0:1/fs:.25;
x = sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + 2*randn(size(t));
f = 1000/251*(0:127); %frequency axis of size 128
p =  periodogram(y);
plot(f, p(1:128)); %size must agree.
title('Periodogram Power Spectral Density Estimate');
xlabel('Frequency');
ylabel('Power');
