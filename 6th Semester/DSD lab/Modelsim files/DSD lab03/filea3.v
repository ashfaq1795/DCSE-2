module buffer_8bits(out,in);
parameter n=7;
input [n:0]in;
output [n:0]out;
assign out=in;
endmodule
module test_bench4();
parameter n=7;
reg [n:0]in;
wire [n:0]out;
buffer_8bits td(out,in);
initial begin
$display("IN  OUT");
$monitor("%d  %d",in,out);
#10 in=8'b00000000;
#10 in=8'b00001010;
#10 in=8'b10110000;
#10 in=8'b11000000;
#10 in=8'b01001001;
#10 in=8'b01000110;
#10 in=8'b00100100;
#10 in=8'b01100000;
#10 in=8'b01001000;
end
endmodule
