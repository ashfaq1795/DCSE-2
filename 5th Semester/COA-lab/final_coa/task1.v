module decoder2x4(A,B,D0,D1,D2,D3);
input A,B;
output D0,D1,D2,D3;
wire nA,nB;
not n1(nA,A);
not n2(nB,B);
and a1(D0,nA,nB);
and a2(D1,A,nB);
and a3(D3,nA,B);
and a4(D4,A,B);
endmodule