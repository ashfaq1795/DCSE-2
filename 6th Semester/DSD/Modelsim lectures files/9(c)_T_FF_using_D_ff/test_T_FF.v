module test_T_FF;
reg clock,rst;
wire q;
T_FF_using_D tff(.reset(rst),.clk(clock),.Q(q));
always
#10 clock=~clock;
initial begin
rst=1; clock=1;
#10
rst=0;
#20
rst=0;
#50
rst=1;
#50
rst=0;
end
initial
$monitor("%d ,reset=%b ,Q=%b",$time,rst,q);
endmodule 
