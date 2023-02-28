module test_T_FF;
reg T,clk,reset;
wire Q;
T_FF tff(.reset(reset),.T(T),.En(clk),.Q(Q));
always
#10 clk=~clk;
initial begin
reset=1; clk=1; T=0;
#10
T=1;
reset=0;
#20
T=0;
#10
T=1;
#20
reset=0;
#30
reset=1;
#10
T=0;
end
initial
$monitor("%d ,reset=%b ,T=%b ,Q=%b",$time,reset,T,Q);
endmodule