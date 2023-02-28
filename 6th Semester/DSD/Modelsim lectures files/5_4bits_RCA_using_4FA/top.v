module top;

	wire [3:0] Su, A, B;
	wire Co;
	
	RCA rca (Co, Su, A, B);
	test_RCA trca (Co, Su, A, B);
	
endmodule