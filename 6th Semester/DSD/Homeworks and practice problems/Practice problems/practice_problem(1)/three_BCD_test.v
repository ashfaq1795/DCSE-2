module three_BCD_test(clr,clock,bh,bt,bo);
input [3:0] bh,bt,bo;
output clr,clock;
reg clr,clock;
always 
#5 clock=~clock;
initial
begin
	$monitor($time,": clr: %b cout: %d%d%d",clr,bh,bt,bo);
	clr=1'b1;
	clock=1'b0;
	#10
	clr=1'b0;
	#5000 $finish;
end
endmodule