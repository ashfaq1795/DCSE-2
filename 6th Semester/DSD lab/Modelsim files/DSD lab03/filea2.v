module test_bench1();
parameter N=7;
reg [N:0]in;
wire [N:0]out;
buffer td(out,in);
initial begin
$display("IN  OUT");
$monitor("%d  %d",in,out);
#10 in=8'b00000000;
#10 in=8'b00000111;
#10 in=8'b00110001;
#10 in=8'b10101010;
#10 in=8'b00110100;
#10 in=8'b11010011;
#10 in=8'b01001100;
end
endmodule


