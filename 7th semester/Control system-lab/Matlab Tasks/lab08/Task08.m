%using matlab and symbolic toolbox to help you find the of the currents.
clc
clear all
close all 

syms s I1 I2 I3 V
A=[(2*s+2), -(2*s+1), -1;
  -(2*s+1), (9*s+1), -4*s;
  -1, -4*s,(4*s+1+(1/s))];
B=[I1;I2;I3];
C=[V;0;0];
B=inv(A)*(C)  % inversion method.
pretty(B)
    