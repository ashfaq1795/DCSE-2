module mux41 (OUT, I, Sel);
	
	output OUT;
	input [3:0] I;
	input [1:0] Sel;
	
	wire [1:0] mux;

	mux21 m0 (mux[0], {I[1], I[0]}, Sel[0]);
	mux21 m1 (mux[1], {I[3], I[2]}, Sel[0]);
	mux21 m2 (OUT, {mux[1], mux[0]}, Sel[1]);	

endmodule