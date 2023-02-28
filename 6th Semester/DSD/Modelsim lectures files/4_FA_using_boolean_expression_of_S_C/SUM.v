module SUM (S, A, B, Cin);
 
	output S;
	input A, B, Cin;
	
	// Behavioral code
	assign S = A^B^Cin;
	
endmodule