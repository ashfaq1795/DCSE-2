module stim_d();
reg A,B;
wire D0,D1,D2,D3;
decoder2x4 td(A,B,D0,D1,D2,D3);
initial 
begin
$display("A,B,D0,D1,D2,D3");
#10 A=0;B=0;
//#10 $display("%b,%b,%b,%b,%b,%b",A,B,D0,D1,D2,D3);
#10 A=0;B=1;
//#10 $display("%b,%b,%b,%b,%b,%b",A,B,D0,D1,D2,D3);
#10 A=1;B=0;
//#10 $display("%b,%b,%b,%b,%b,%b",A,B,D0,D1,D2,D3);
#10 A=1;B=1;
//#10 $display("%b,%b,%b,%b,%b,%b",A,B,D0,D1,D2,D3);
end
initial
begin
$monitor("A=%b,B=%b,D0=%b,D1=%b,D2=%b,D3=%b",A,B,D0,D1,D2,D3);
end
endmodule