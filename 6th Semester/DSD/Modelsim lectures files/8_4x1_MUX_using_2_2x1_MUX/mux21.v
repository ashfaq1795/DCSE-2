module mux21 (OUT, I, Sel);
	
	output OUT;
	input [1:0] I;
	input Sel;
	
	reg OUT;

	always @(I, Sel)		
		case (Sel)
			1'b0: OUT = I[0];
			1'b1: OUT = I[1];
		endcase

endmodule