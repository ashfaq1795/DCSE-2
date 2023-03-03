module stimg1();
reg A,B,C;
wire F;
general1 td(A,B,C,F);
initial
begin
#10 A=0;B=0;C=0;
#10 A=0;B=0;C=1;
#10 A=0;B=1;C=0;
#10 A=0;B=1;C=1;
#10 A=1;B=0;C=0;
#10 A=1;B=0;C=1;
#10 A=1;B=1;C=0;
#10 A=1;B=1;C=1;
end
initial 
begin
#2 $monitor("A=%b,B=%b,C=%b,F=%b",A,B,C,F);
end
endmodule