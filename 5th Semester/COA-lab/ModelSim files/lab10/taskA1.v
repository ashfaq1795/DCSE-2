module mux2x1(A,B,sel,F);
input A,B,sel;
output F;
wire nsel,F1,F2;
not n1(nsel,sel);
and a1(F1,A,nsel);
and a2(F2,B,sel);
or o1(F,F1,F2);
endmodule


