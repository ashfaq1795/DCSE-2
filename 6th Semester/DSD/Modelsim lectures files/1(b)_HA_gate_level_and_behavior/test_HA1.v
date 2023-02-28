module test_HA1; //test bench to test HA1 (Half Adder)

	// Inputs are regs here
	reg A, B;
		
	// Outputs are wires here
	wire Sum, Carry;
	
	// Instantiate the Unit/Design Under Test (U/DUT)
	// HA1 dut (A, B, Sum, Carry);  // Positional association
	HA1 dut (.s(Sum), .c(Carry), .a(A), .b(B));  // Explicit association

	initial begin
		// Initialize Inputs		
		A = 0;
		B = 0;
		#10	
		B = 1;
		#10
		A = 1;
		#10
		B = 0;		
	end
	      
endmodule