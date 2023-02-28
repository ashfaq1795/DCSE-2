module Top (CLK, RESET, OUT_DATA);

	input CLK, RESET;
	output [15:0] OUT_DATA;
	
	//Place your code here
	
	wire [0:3] Q;
	
	JS_Counter jc (CLK, RESET, Q);
	Dec_4x16 dec (Q[0], Q[1], Q[2], Q[3], 1'b1, OUT_DATA);
	
endmodule