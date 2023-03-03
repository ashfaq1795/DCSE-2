module stimmux4x1();
reg A,B,C,D,sel0,sel1;
wire F;
mux4x1 td(A,B,C,D,sel0,sel1,F);
initial
begin
#20 A=1;B=0;C=0;D=0;sel1=0;sel0=0;
#20 A=0;B=1;C=0;D=0;sel1=0;sel0=1;
#20 A=0;B=0;C=1;D=0;sel1=1;sel0=0;
#20 A=0;B=0;C=0;D=1;sel1=1;sel0=1;
end
initial
begin
$monitor("A=%b,B=%b,C=%b,D=%b,F=%b,sel1=%b,sel0=%b",A,B,C,D,sel0,sel1,F);
end
endmodule