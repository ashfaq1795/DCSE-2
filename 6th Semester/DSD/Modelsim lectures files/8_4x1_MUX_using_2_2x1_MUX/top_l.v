module top_l;

	wire OUT;
	wire [3:0] I;
	wire [1:0] Sel;
	
	mux41 m1 (OUT, I, Sel);
	test_mux41 t1 (OUT, I, Sel);
	
endmodule