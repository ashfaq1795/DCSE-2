module test_D_latch;
reg D,clock;
wire Q;
D_Latch dl(.D(D),.Q(Q),.clk(clock)); //explici association...
initial begin
D=0; clock=0;
#10
D=1;
#30
clock=1; D=0;
#40
D=1;
#20
clock=0;
#10
D=0;
end
//we can also create a clock here like.
//always
//#10 clock=~clock;
initial
$monitor("%d ,clock=%b ,D=%b ,Q=%b",$time,clock,D,Q);
endmodule