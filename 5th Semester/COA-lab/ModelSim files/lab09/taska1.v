module decoder2x4(A,B,y1,y2,y3,y4);
input A,B;
output y1,y2,y3,y4;
wire nA,nB;   //nA= not of A. nB not of B.
not n1(nA,A);   //outputs always first and inputs later.
not n2(nB,B);
and a1(y1,nA,nB);
and a2(y2,nA,B);
and a3(y3,A,nB);
and a4(y4,A,B);
endmodule
//verilog code is case sensetive. every term will lower case.
//empty line not allowed among allowed otherwise it give error.

