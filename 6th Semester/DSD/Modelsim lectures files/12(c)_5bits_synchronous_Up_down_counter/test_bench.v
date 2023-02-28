module test_bench;
reg clk,mode,reset;
wire [4:0]count;

UD_5bits ud(.clk(clk),.mode(mode),.count(count),.reset(reset));
always
#5 clk=~clk;

initial
begin
     clk=1'b0;
     mode=1'b0;
     reset=1'b1;  //count set to 00000
     #10 reset=1'b0; //start down counting
     #50 mode=1'b1;   //start up counting
     #50 reset=1'b1;   //count set to 00000
     #20 reset=1'b0;   //again start up counting because mode=1.
end
initial
$monitor($time," mode=%b, Count=%d",mode,count);
endmodule
