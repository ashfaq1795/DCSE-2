clc
clear all
close all
t=0:0.01:10;
u=sin(t);
num=100;
denum=[1 4 20];
sys=tf(num,denum);
y=lsim(sys,u,t);
%lsim: gives the time response of LTI system to arbaitrory inputs.
%u is arbitrary input.
%t is time span.
plot(y);
title('sinusiodal Response');
grid on