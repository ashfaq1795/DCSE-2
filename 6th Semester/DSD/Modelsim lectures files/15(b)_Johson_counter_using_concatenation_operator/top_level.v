module top_level;
wire clk,clear;
wire [5:0] c;
       
test_JC td(.count(c),.clear(clear),.clk(clk));
JC_6bits jc1(.clk(clk),.clear(clear),.count(c));  //explicit association. 

endmodule