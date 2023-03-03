module mux4x1(A,B,C,D,sel0,sel1,F);
input A,B,C,D,sel0,sel1;
output F;
assign F=sel1?(sel0?D:C):(sel0?B:A);
endmodule
