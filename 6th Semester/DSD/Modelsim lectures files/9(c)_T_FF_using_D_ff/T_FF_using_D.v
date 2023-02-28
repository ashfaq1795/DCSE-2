module T_FF_using_D(Q,clk,reset); //in T_FF using D there is no external input T. Previous Q of D is toggled and give as input of T_FF.
input clk,reset;
output Q;
wire D;
not (D,Q);
D_FF dff1(Q,clk,reset,D); //as reset input is not used in D_FF so in T it will also not.
endmodule 
