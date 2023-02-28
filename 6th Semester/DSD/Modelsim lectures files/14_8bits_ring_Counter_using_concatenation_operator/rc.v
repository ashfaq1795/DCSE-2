module rc (clk, init, count);  //we can also model it using D_FF

	input clk, init;
	output [7:0] count;
	
	reg [7:0] count;       //ring counter does two function 1)shift  2)rotate

	always @(init or posedge clk)
	begin
		if (init)
			count = 8'b10000000;
		else 
		begin
			count = {count[6:0], count[7]}; 
		end
	end
	
endmodule