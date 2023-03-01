clc
clear all
close all
A=[0 1 5 0;0 0 1 0;0 0 0 1; -7 -9 -2 -3];
B=[0;5;8;2];
C=[1 3 6 6];
D=0;
tt=ss(A,B,C,D);
tt=tf(tt)


