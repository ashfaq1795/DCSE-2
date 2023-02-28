module test_counter(reset,count,clk);
input [5:0]count;
output reset,clk;
reg reset,clk;

always 
#5 clk=~clk;
initial
begin
clk=1;
reset=0;  //reset the counter
#15  reset=1;
#70  reset=0;
#140 reset=1;
end
initial
$monitor($time,"  reset=%b, count=%d",reset,count);
endmodule

