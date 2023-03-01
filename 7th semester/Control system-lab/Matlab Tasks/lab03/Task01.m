clc
clear all
close all
num=30;
denum=[1 5 10];
r=roots(denum)
sys=tf(num,denum);
figure
pzmap(sys,'r');
step_response=step(sys);
figure
plot(step_response);
xlabel('time');
ylabel('Amplitude');
title('stable System');

