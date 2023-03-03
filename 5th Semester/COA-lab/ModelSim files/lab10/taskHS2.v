module stim_half_sub();
reg A,B;
wire Df,Bor;
half_subtractor td(A,B,Df,Bor);
initial
begin
$display("A,B,Df,Bor");
A=0;B=0;
#20 $display("%b,%b,%b,%b",A,B,Df,Bor);
A=0;B=1;
#20 $display("%b,%b,%b,%b",A,B,Df,Bor);
A=1;B=0;
#20 $display("%b,%b,%b,%b",A,B,Df,Bor);
A=1;B=1;
#20 $display("%b,%b,%b,%b",A,B,Df,Bor);
end
endmodule