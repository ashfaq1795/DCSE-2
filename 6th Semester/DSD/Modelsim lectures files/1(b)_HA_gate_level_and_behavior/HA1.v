module HA1 (a, b, s, c);
 
	input a,b;
	output s,c;
	
	// Behavioral code
	assign {c, s} = a + b;
	
endmodule

