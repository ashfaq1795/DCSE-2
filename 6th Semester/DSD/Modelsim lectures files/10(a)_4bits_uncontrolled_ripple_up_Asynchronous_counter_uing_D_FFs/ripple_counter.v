module ripple_counter (q, clock, reset);  //Asynchronous 4 bits ripple counter. asynchronus mean all T_FF don't depend upon same clock.

	output [3:0] q; 
	input clock, reset;

	T_FF tff0 (q[0], clock, reset);
	T_FF tff1 (q[1], q[0], reset);
	T_FF tff2 (q[2], q[1], reset);
	T_FF tff3 (q[3], q[2], reset);
	
endmodule