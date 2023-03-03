module general1(A,B,C,F);
input A,B,C;
output F;
wire nA,nB,a1,a2,x1,xn1;

not n1(nA,A);
not n2(nB,B);
and ad1(a1,A,B);
and ad2(a2,nA,nB);
xor xr1(x1,a1,C);
xnor xnr1(xn1,C,a2);
or o1(F,x1,xn1);
endmodule
