%find inverse laplace transform using symbolic toolbox.
clc
clear
close all
syms s;
c=2/(s+1)*(s+2)*(s+3);
c=ilaplace(c)
pretty(c)
