module HA2 (Su, Ca, A, B);
 
	output Su, Ca;
	input A, B;
		
	// Structural code
	SUM s1 (Su, A, B); // Connection by position
	CARRY c1 (.A(A), .B(B), .C(Ca)); // Connection by reference
	
endmodule