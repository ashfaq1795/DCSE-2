module test_D_FF;
reg En,D;
wire Q;

D_FF ff(Q,En,D);
initial begin
D=0; En=0;
#10
D=1;
#30
D=1;
#15
D=0;
#30
D=1;
end
always  //we can also give value to clock(enable) menually just we gave in D_latch. 
#10 En=~En;
initial
$monitor("%d ,En=%b ,D=%b ,Q=%b",$time,En,D,Q);
endmodule