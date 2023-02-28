module top_level;
	
	wire OUT;
	wire [1:0] I;
	wire Sel;

	mux21 m21 (OUT, I, Sel);
	test_mux21 tm21 (OUT, I, Sel);

endmodule