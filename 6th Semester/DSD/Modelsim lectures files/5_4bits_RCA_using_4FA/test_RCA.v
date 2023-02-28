module test_RCA (Co, Su, A, B);

	input Co;
	input [3:0] Su;

	output [3:0] A, B;
	reg [3:0] A, B;
	

	initial begin
		A = 4'b0000;
		B = 4'b1111;
		#15
		A = 4'b1111;
		B = 4'b1111;
		#15
		A = 4'b1010;
		B = 4'b1111;		
	end
	
	initial
		$monitor ("%d, A=%b, B=%b, S=%b, Cout=%b", $time, A, B, Su, Co);

endmodule