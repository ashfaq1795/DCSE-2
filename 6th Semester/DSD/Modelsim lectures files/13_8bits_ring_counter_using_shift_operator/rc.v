module rc (clk, init, count);   //ring counter using shift register. 

	input clk, init;
	output [7:0] count;
	
	reg [7:0] count;

	always @(init or posedge clk)
	begin
		if (init)
			count <= 8'b10000000;
		else 
		begin
			count <= count << 1; //Shift Left (Fill with Zero)
			count[0] <= count[7];
			//Compare blocking assignment (=) VS non-blocking assignment (<=)
		end
	end
	
endmodule

//ring counter does two functions 1)shift  2)rotate