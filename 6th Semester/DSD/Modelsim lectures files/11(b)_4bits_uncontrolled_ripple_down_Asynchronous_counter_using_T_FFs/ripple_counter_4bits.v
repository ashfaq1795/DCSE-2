module Ripple_counter_4bits(Q,clk,reset,T); //Asynchronous 4 bits ripple counter. asynchronous mean all T_FFs don't depend upon same clock.
input clk,reset,T;
output [3:0]Q;

T_FF t1(Q[0],clk,T,reset); //external clock always applied to first T_ff so output will Q[0].
T_FF t2(Q[1],~Q[0],T,reset);
T_FF t3(Q[2],~Q[1],T,reset);
T_FF t4(Q[3],~Q[2],T,reset);

endmodule
//as in Ripple counter T=1 permenently but here we check counter for T=0;??? 
//at T=1 permenently it start counting and output of T FF always toggle of previous output.
//at T=0 permenently it will pause counting i,e if counting is at 234 then suddenly the value of T become 0.
//then counting will paused at 234 and will not loss. again if T=1 the counting will start from 235 rather tahn from 0.
