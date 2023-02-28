module test_4bits_R_C(Q,clk,reset);
output clk,reset;
input [3:0]Q;
reg clk,reset;
always
#10 clk=~clk;
initial begin
clk=0; reset=1;  //i reset all T_ff initially so that all output 0 q1 q2 q3 become zero.
                 //counting will start from 0.
#15
reset=0;
end
initial
$monitor($time," reset=%b ,Q=%d",reset,Q);
endmodule