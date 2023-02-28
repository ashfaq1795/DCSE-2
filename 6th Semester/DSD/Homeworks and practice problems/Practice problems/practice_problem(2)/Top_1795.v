module top;
wire [15:0]out;
wire clock,clear;
circuit_test ct(clock,clear,out);
combine_circuit cc(out,clock,clear);
endmodule