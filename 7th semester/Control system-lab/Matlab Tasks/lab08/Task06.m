%find inverse laplace transform using symbolic toolbox.
clc
clear
close all
syms s;
c=3/s*(s^2+2*s+5);
c=ilaplace(c)
pretty(c)
