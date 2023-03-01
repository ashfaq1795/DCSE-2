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

series1=series(sys1,sys2);

series_equivalent=series(series1,sys3)

step_response=step(series_equivalent);

plot(step_response);



