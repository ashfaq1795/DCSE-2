clc
clear all
close all
num=30;
denum=[3 -2 10];
r=roots(denum)
sys=tf(num,denum);
figure
pzmap(sys,'r');
step_response=step(sys);
figure
plot(step_response);
xlabel('time');
ylabel('Amplitude');
title('Unstable System');
