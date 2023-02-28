module test_HA; //test bench to test HA (Half Adder)

	// Inputs are regs here
	reg A, B;
		
	// Outputs are wires here
	wire Sum, Carry;
	
	// Instantiate the Unit/Design Under Test (U/DUT)
	// HA dut (A, B, Sum, Carry);  // Positional association
	HA dut (.a(A), .b(B), .s(Sum), .c(Carry));  // Explicit association

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