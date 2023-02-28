module top_level;
wire clr,clock;  //as no value is assign to any veriable so all reg.
wire [3:0] count;

test_JC td(count,clock,clr);   
JC_4bits jc(count,clock,clr);
endmodule