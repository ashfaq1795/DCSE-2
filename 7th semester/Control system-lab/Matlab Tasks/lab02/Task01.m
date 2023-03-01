clc
clear all
close all
num=100;
denum=[1,4,20];
sys=tf(num,denum);  %when impulse input is passed from a system change in output is called impulse response.
im=impulse(sys);    %when step input is passed from a system change in output is called step response.
st=step(sys);
plot(im);
title('Impulse Response');
grid on
figure 
plot(st);
title('Step response');
grid on
