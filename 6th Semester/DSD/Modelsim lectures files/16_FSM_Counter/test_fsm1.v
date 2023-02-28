module test_fsm;   //we can also make top level module...
reg clk;  //define as reg because values assign.
wire [2:0] count;

fsm_counter fsm(count,clk);
initial //initial block
begin
     clk=1;
     #10 clk=0;
end
always  //always block
#5 clk=~clk;
initial  //initial block.
$monitor($time," clk=%b, count=%d",clk,count);
endmodule
 
 //all three block will execute in parallel...
 //we can change the position of these blocks...    