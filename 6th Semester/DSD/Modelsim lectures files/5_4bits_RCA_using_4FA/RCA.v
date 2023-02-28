module RCA (Cout, S, A, B);

	output Cout;
	output [3:0] S;
	input [3:0] A, B;
	
	wire [2:0] C;   //Intermediate/Internal Carries

	// FA1 (Sum, Cout, A, B, Cin);   //FA1's Interface (I/O Pins)

	FA1 fa0 (S[0], C[0], A[0], B[0], 1'b0);
	FA1 fa1 (S[1], C[1], A[1], B[1], C[0]);
	FA1 fa2 (S[2], C[2], A[2], B[2], C[1]);
	FA1 fa3 (S[3], Cout, A[3], B[3], C[2]);

endmodule