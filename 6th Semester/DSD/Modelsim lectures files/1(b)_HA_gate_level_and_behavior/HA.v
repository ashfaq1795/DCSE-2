module HA (a, b, s, c);
 
	input a,b;
	output s,c;
	
	// Gate level code
	xor x1 (s, a, b);
	and a1 (c, a, b);
	
endmodule