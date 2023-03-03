module mux2x1(A,B,sel,F);
input A,B,sel;
output F;
assign F=sel? A:B;
endmodule
