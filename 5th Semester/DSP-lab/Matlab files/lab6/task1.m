clc
clear all
close all
fs=1000;  %sampling frequency
t=0:0.001:0.2;
fc=200;   %carrier frequency
m=sin(2*pi*30*t)+sin(2*pi*40*t);   %modulating signal
c=cos(2*pi*fc*t);      %carrier Signal

plot(t,m,'r',t,c,'b');
xlabel('Time-Axis');
ylabel('Amplitude-Axis');
title('Modulating Signal,Carrier Signal');
legend('Modulating Signal','Carrier Signal');

figure
fDev = 50; %frequency Deviation in carrier and sampling frequency
y = fmmod(m, fc, fs, fDev);
%fmmod uses the message signal X to modulate the
%carrier frequency Fc (Hz) and sample frequency Fs (Hz),  
%where Fs>2*Fc for recovering original carrier signal at reciver. 
%FDEV (Hz) is the amount of frequency deviation of the modulated signal.
plot(t,m,'r',t,y,'b'); %y=Modulated Carrier Signal.
xlabel('Time-Axis');
ylabel('Amplitude-Axis');
title('Modulating Signal,Modulated Signal');
legend('Modulating Signal','Modulated Signal');


figure
fDev = 100; %frequency Deviation in carrier and sampling frequency
y = fmmod(m, fc, fs, fDev);
plot(t,m,'r',t,y,'b');   %y=Modulated Carrier Signal.
xlabel('Time-Axis');
ylabel('Amplitude-Axis');
title('Modulating Signal,Modulated Signal');
legend('Modulating Signal','Modulated Signal')


figure
d=fmdemod(y,fc,fs,fDev);  %y=Modulated Carrier Signal.
%demodulates the FM modulated signal y at
%the carrier frequency Fc (Hz). Y and Fc have sample frequency Fs (Hz).
%FREQDEV is the frequency deviation (Hz) of the modulated signal.
plot(t,m,'r',t,d,'b');  
xlabel('Time-Axis');
ylabel('Amplitude-Axis');
title('message signal,Demodulated Signal');
legend('message signal','Demodulated Signal')

