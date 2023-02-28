module test_Mealy;
reg n,d,clk,reset;
wire open;

vanding_machine vm(open,d,n,clk,reset);

always
#10 clk=~clk;
initial
begin
clk=0; reset=0; n=0; d=0;
#5 reset=1;
#10 reset=0;
#5 n=1;
#20 n=0; d=1;
#20 d=0;
#20 reset=1;
#10 reset=0;
#20 n=1;
#20 n=0;
#10 n=1;
#20 n=0;
#10 n=1;
#20 n=0;
#50 $finish;
end
endmodule
