module BCD(Q,clock,clear);
input clock,clear;
output [3:0]Q;
reg [3:0]Q;
always @(negedge clock)
	if(clear |Q== 4'b1001)
	Q=4'b0000;
	else
	Q=Q+1;
endmodule
