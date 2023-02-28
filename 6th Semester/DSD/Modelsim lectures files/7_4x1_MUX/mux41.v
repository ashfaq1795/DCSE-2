module mux41 (OUT, I, Sel);
	
	output OUT;
	input [3:0] I;
	input [1:0] Sel;
	
	reg OUT;

	always @ (I, Sel) 
		case (Sel)
			2'd0: OUT = I[0];
			2'd1: OUT = I[1];
			2'd2: OUT = I[2];
			2'd3: OUT = I[3];
		endcase

endmodule