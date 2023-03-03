module half_subtractor(A,B,Df,Bor);
input A,B;
output Df,Bor;
wire nA;
not n(nA,A);
xor x(Df,A,B);
and a(Bor,nA,B);
endmodule

