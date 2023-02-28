module test_bench2();
reg [3:0] A,B;
wire [3:0]sum;
wire Cout;
Ripplecarryadder td(sum,Cout,A,B);
initial
begin
$display("A B sum Cout");
$monitor("%d,%d,%d,%d",A,B,sum,Cout);
#10 A=4'b0000;B=4'b0000;
#10 A=4'b0001;B=4'b0001;
#10 A=4'b1100;B=4'b0011;
#10 A=4'b1010;B=4'b1001;
#10 A=4'b0010;B=4'b1000;
#10 A=4'b1100;B=4'b0110;
#10 A=4'b1110;B=4'b0111;
#10 A=4'b0101;B=4'b1101;
#10 A=4'b1111;B=4'b1111; 
end
endmodule



