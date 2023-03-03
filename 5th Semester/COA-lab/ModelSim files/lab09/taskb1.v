module decoder3x8(A,B,C,y0,y1,y2,y3,y4,y5,y6,y7);
input A,B,C;
output y0,y1,y2,y3,y4,y5,y6,y7;
wire nA,nB,nC;
not n1(nA,A);
not n2(nB,B);
not n3(nC,C);
and a0(y0,nA,nB,nC);
and a1(y1,nA,nB,C);
and a2(y2,nA,B,nC);
and a3(y3,nA,B,C);
and a4(y4,A,nB,nC);
and a5(y5,A,nB,C);
and a6(y6,A,B,nC);
and a7(y7,A,B,C);
endmodule
