module CARRY (Cout, A, B, Cin);
 
	output Cout;
	input A, B, Cin;
	
	// Behavioral code
	assign Cout = (A&B) | (B&Cin) | (A&Cin);
	
endmodule