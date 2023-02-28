module SUM (S, A, B, Cin);
 
	output S;
	input A, B, Cin;
	
	// Behavioral Code
	assign S = A^B^Cin;
	
endmodule