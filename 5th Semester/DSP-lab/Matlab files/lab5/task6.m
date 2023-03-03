clc
clear all
close all
fs = 1000;
t = 0:1/fs:.25;
x = sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + 2*randn(size(t));
L = length(y);
Y = fft(y);
Pyy = Y .* conj(Y) / 251;
f = 1000/251*(0:127);
plot(f(1:50), Pyy(1:50)); %for zoom in
%plot(f, Pyy(1:128));
title('Power Spectral Density');
xlabel('Frequency');
ylabel('Power');
