module D_Latch(Q,clk,D);
input D,clk;
output Q;
assign Q=clk?D:Q;  //in case of assign keyword values can also be assign to output data type veriable. no need to decleare as reg.
//this latch positive level trigger D_latch. 
endmodule
