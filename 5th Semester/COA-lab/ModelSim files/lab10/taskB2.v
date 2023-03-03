module stim_mux4x1();
reg A,B,C,D,s1,s2;
wire F;
mux4x1 tb(A,B,C,D,s1,s2,F);
initial
begin
$display("A,B,C,D,s1,s2,F");
A=1;B=0;C=0;D=0;s1=0;s2=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b",A,B,C,D,s1,s2,F);
A=0;B=1;C=0;D=0;s1=0;s2=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b",A,B,C,D,s1,s2,F);
A=0;B=0;C=1;D=0;s1=1;s2=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b",A,B,C,D,s1,s2,F);
A=0;B=0;C=0;D=1;s1=1;s2=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b",A,B,C,D,s1,s2,F);
end
endmodule


