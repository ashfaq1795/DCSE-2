clc
clear 
close all
[y1,fs1]=audioread('sound1.wav');
sound(y1,fs1);
pause(6);
[t,fs]=audioread('beep.wav');
sound(t,fs);
[y2,fs2]=audioread('sound2.wav');
sound(y2,fs2);
pause(6)
[t,fs]=audioread('beep.wav');
sound(t,fs);
[y3,fs3]=audioread('sound3.wav');
sound(y3,fs3);

spectrum1=fft(y1);
n1=length(y1);
ts1=1/fs1;
f1=(0:n1-1)*(ts1/n1);
subplot(2,2,1)
plot(f1,abs(spectrum1));
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Spectrum graph of voice 1');

spectrum2=fft(y2);
n2=length(y2);
ts2=1/fs2;
f2=(0:n2-1)*(ts2/n2);
subplot(2,2,2)
plot(f2,abs(spectrum2));
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Spectrum graph of voice 2');

spectrum3=fft(y3);
n3=length(y3);
ts3=1/fs3;
f3=(0:n3-1)*(ts3/n3);
subplot(2,2,3)
plot(f3,abs(spectrum3));
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Spectrum graph of voice 3');

spectrum4=fft(t);
n=length(t);
ts=1/fs;
f4=(0:n-1)*(ts/n);
subplot(2,2,4)
plot(f4,abs(spectrum4));
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Spectrum graph of tune signal');


lpf1=lowpass(y1,1000,fs1);
lpf2=lowpass(y2,1000,fs2);
lpf3=lowpass(y3,1000,fs3);
lpf4=lowpass(t,1000,fs);

 sound(lpf1,fs1);
 pause(6);
 sound(lpf4,fs);
 sound(lpf2,fs2);
 pause(6)
 sound(lpf4,fs);
 sound(lpf3,fs3);


%c1 c2 c3 are different carrier frequencies.
c1=8000;
c2=14000;
c3=18000;
mod1=fmmod(y1,c1,fs1,1000);  %signal1 modulated
mod2=fmmod(y2,c2,fs2,1000);  %signal2 modulated
mod3=fmmod(y3,c3,fs3,1000);  %signal3 modulated



 bp1=bandpass(mod1,[300 1000],fs1);
 bp2=bandpass(mod2,[300 1000],fs2);
 bp3=bandpass(mod3,[300 1000],fs3);
 
 bp1=bp1(1:220097);
 bp3=bp3(1:220097);
 multiplexer=bp1+bp2+bp3;
 fmultiplexer=abs(fft(multiplexer));
 noise=awgn(multiplexer,10);
 

 signal1=mod3+mod2;
 demux_signal1=multiplexer-signal1;

 signal2=mod3+mod1;
 demux_signal2=multiplexer-signal2;
 
 signal3=mod1+mod2;
 demux_signal3=multiplexer-signal3;
 
 demod1=ssbdemod(demux_signal1,c1,fs1);
 demod2=ssbdemod(demux_signal2,c2,fs2);
 demod3=ssbdemod(demux_signal3,c3,fs3);
 
 
 nose_remove1=lowpass(demod1,1000,fs1);
 noise_remove2=lowpass(demod2,1000,fs2);
 noise_remove3=lowpass(demod3,1000,fs3);


 sound(noise_remove1,fs1);
 pause(6)
 sound(noise_remove2,fs2);
 pause(6)
 sound(noise_remove2,fs3);
 
 
 
 
