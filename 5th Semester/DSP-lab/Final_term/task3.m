clc
clear all
close all
sample=20000;
noise=awgm(sample);
filter=lowpass(noise,200,20000);
plot(noise);
Y=fft(filter);
n=length(