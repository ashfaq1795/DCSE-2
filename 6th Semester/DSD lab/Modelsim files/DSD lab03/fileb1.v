module mux_3_bits(out,I0,I1,sel);
parameter N=2;
input [N:0] I0,I1;
input sel;
output [N:0]out;
wire w1;
wire [3:1] w2,w3;
not n1(w1,sel);
and a1(w2[1],w1,I0[0]);  //input I0 of 3 bits
and a2(w2[2],w1,I0[1]);
and a3(w2[3],w1,I0[2]);

and a4(w3[1],sel,I1[0]);  //input I1 of 3 bits
and a5(w3[2],sel,I1[1]);
and a6(w3[3],sel,I1[2]);

or r1(out[0],w2[1],w3[1]);  //or input I0 and I1 bit-by-bit
or r2(out[1],w2[2],w3[2]);
or r3(out[2],w2[3],w3[3]);

endmodule

module test_bench2();
parameter N=2;
reg [N:0] I0,I1;
reg sel;
wire [N:0]out;
mux_3_bits td(out,I0,I1,sel);
initial begin
$display("I0   I1   sel  Out");
$monitor("%b   %b   %b   %b",I0,I1,sel,out);
#10 I0=3'b000;I1=3'b000;sel=0;
#10 I0=3'b011;I1=3'b110;sel=1;
#10 I0=3'b010;I1=3'b100;sel=0;
#10 I0=3'b000;I1=3'b011;sel=1;
#10 I0=3'b110;I1=3'b100;sel=1;
#10 I0=3'b111;I1=3'b011;sel=0;
end
endmodule


