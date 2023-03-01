clc
clear
close all
syms s;
c=1/(s*(s+2));
c=ilaplace(c)
pretty(c)

%inverse laplce transform convet system again to time domain from frequency
%domain.
