module test_bench1();
reg A,B,Cin;
wire sum,Cout;
FA td(Cout,sum,A,B,Cin);
initial
begin
#10 A=0;B=0;Cin=0;
#10 A=0;B=0;Cin=1;
#10 A=0;B=1;Cin=0;
#10 A=0;B=1;Cin=1;
#10 A=1;B=0;Cin=0;
#10 A=1;B=0;Cin=1;
#10 A=1;B=1;Cin=0;
#10 A=1;B=1;Cin=1;
end
initial
begin
$display("A,B,Cin,sum,Cout");
$monitor("%b,%b,%b,%b,%b ",A,B,Cin,sum,Cout);
end
endmodule 
 