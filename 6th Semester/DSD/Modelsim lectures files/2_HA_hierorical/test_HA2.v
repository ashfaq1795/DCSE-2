module test_HA2; //test bench to test HA2 (Half Adder)

	// Inputs are regs here
	reg A, B;
		
	// Outputs are wires here
	wire Sum, Carry;
	
	// Instantiate the Unit/Design Under Test (U/DUT)
	// HA2 dut (Sum, Carry, A, B);  // Positional association
	HA2 dut (.A(A), .B(B), .Su(Sum), .Ca(Carry));  // Explicit association

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
