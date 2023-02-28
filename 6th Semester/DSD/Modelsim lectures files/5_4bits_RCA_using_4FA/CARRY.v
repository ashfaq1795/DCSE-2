module CARRY (Cout, A, B, Cin);
 
	output Cout;
	input A, B, Cin;
	
	// Behavioral Code
	assign Cout = (A&B) | (B&Cin) | (A&Cin);
	
endmodule