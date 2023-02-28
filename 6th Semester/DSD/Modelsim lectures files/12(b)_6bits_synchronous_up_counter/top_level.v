module top_level;
wire clk,rst;
wire [5:0]count;

test_counter t3(rst,count,clk);
counter c1(count,rst,clk);

endmodule