module combine_circuit(out,clock,clear);  //reset and clear same thing.
input clock,clear;
output [15:0] out;
wire [3:0]w;
johnson_counter td1(w,clock,clear);
decoder4x16 td2(out,1'b1,w[3],w[2],w[1],w[0]);  //enable connect with vcc for ever.
endmodule