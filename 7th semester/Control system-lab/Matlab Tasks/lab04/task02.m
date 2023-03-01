clc
clear all
close all

n1=1;
d1=[1 1];
sys1=tf(n1,d1);

n2=1;
d2=[1 3];
sys2=tf(n2,d2);

n3=[1 3];
d3=[1 5];
sys3=tf(n3,d3);

P1=parallel(sys1,sys2);

Parallel_equivalent=parallel(P1,sys3)

step_response=step(Parallel_equivalent);

plot(step_response);






