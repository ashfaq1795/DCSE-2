module top_JC;

	wire CLK, CLR;
	wire [0:3] Q;

	JS_Counter jc (CLK, CLR, Q);
	test_JC  t_jc (CLK, CLR, Q);

endmodule