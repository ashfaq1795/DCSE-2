module test_JC(count,clk,clear);
input [3:0]count;               //as here we don't assign value to count so it declare as input.
output clk,clear;               //here we assign value to clock and clear so these are output.

reg clk,clear;                  //as in behaviour case value assign to reg.

always
#5 clk=~clk;
initial
begin
clk=0;
clear=1;
#20 clear=0;
#30 clear=1;
end
initial
$monitor($time," clear=%b, count=%d",clear,count);
endmodule