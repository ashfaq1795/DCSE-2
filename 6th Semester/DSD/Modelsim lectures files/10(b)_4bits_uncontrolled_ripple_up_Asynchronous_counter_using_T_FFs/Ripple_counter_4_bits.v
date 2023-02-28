module Ripple_counter_4bits(Q,clk,reset); //Asynchronous 4 bits ripple counter. asynchronous mean all T_FFs don't depend upon common clock.
input clk,reset;
output [3:0]Q;

T_FF t1(Q[0],clk,1'b1,reset); //external clock always applied to first T_ff so output will Q[0].
T_FF t2(Q[1],Q[0],1'b1,reset);
T_FF t3(Q[2],Q[1],1'b1,reset);
T_FF t4(Q[3],Q[2],1'b1,reset);

endmodule
