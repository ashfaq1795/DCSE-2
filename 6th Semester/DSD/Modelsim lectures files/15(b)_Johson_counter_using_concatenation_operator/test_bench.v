module test_JC(count,clk,clear);
input [5:0]count;               //as here we don't assign value to count so it declare as input.
output clk,clear;               //here we assign value to clock and clear so these are output.

reg clk,clear;                  //as in behaviour case value assign to reg.

always
#5 clk=~clk;
initial
begin
clk=0;
clear=0;
#20 clear=1;
#30 clear=0;
end
initial
$monitor($time," clear=%b, count=%b",clear,count);
endmodule
 