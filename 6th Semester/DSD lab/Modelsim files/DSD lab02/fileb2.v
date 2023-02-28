module test_bench3();
reg A,B,Cin;
wire sum,carry;
FA td(sum,carry,A,B,Cin);
initial
begin
$display("A B Cin sum carry");
$monitor("%b,%b,%b,%b,%b",A,B,Cin,sum,carry); 
#20 A=0;B=0;Cin=0;
#20 A=0;B=0;Cin=1;
#20 A=0;B=1;Cin=0;
#20 A=0;B=1;Cin=1;
#20 A=1;B=0;Cin=0;
#20 A=1;B=0;Cin=1;
#20 A=1;B=1;Cin=0;
#20 A=1;B=1;Cin=1;
end
endmodule

