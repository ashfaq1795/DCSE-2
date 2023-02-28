module top_level;  //without top level file it can also work fine..
wire clock,rst;
wire [3:0]Q;

Ripple_counter_4bits rd(.reset(rst),.clk(clock),.Q(Q));  //explicit association.
test_4bits_R_C td(Q,clock,rst);  //positional association

endmodule