module circuit_test(clk,clr,out);
output clk,clr; 
input [15:0]out;
reg clk,clr;
always
#10 clk=~clk;
initial begin 
clk=1'b0;
clr=1'b0;
#2 clr=1'b1;
end
initial
$monitor($time, ": clr= %b, Result=%b",clr,out);
endmodule