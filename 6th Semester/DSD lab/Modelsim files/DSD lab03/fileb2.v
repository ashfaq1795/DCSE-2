module mux_3_bits(out,I1,I0,sel);
parameter n=2;
input [n:0] I1,I0;
input sel;
output [n:0] out;
assign out= sel? I1:I0;    //" : " act as else statement.
endmodule

module test_bench3();
parameter n=2;
reg [n:0] I1,I0;
reg sel;
wire [n:0]out;
mux_3_bits td(out,I1,I0,sel);
initial begin
$display("I1  I0  Sel  Out");
$monitor("%b  %b  %b  %b",I1,I0,sel,out);
#10 I1=3'b000;I0=3'b001;sel=0;
#10 I1=3'b110;I0=3'b101;sel=1;
#10 I1=3'b010;I0=3'b011;sel=0;
#10 I1=3'b001;I0=3'b011;sel=1;
#10 I1=3'b111;I0=3'b110;sel=0;
end
endmodule
 