module FA1 (Sum, Cout, A, B, Cin);
 
	output Sum, Cout;
	input A, B, Cin;
		
	// Structural Code
	SUM s1 (.S(Sum), .A(A), .B(B), .Cin(Cin));
	CARRY c1 (.Cout(Cout), .A(A), .B(B), .Cin(Cin));
	
endmodule