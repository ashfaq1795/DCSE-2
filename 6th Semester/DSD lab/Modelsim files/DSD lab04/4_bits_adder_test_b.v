module test_4_bits_adder;
reg [3:0]a,b;
wire en;
wire [3:0]sum;
wire [6:0]out;
wire cout;

binary_4_Bits_adder td(out,en,sum,cout,a,b);

initial
begin
$display("sum    en   g   f   e   d   c   b   a");
$monitor("%b     %b   %b  %b  %b   %b   %b  %b  %b",sum,en,out[6],out[5],out[4],out[3],out[2],out[2],out[0]);
#5 a=4'b0000; b=4'b0001;
#5 a=4'b0100; b=4'b0011;
#5 a=4'b0010; b=4'b0001; 
#5 a=4'b0010; b=4'b0101; 
#5 a=4'b0011; b=4'b1001; 
#5 a=4'b0101; b=4'b0100; 
#5 a=4'b1100; b=4'b0011;
#5 a=4'b1110; b=4'b0011;
#5 a=4'b0100; b=4'b0100; 
#5 a=4'b0011; b=4'b0001;  
end
endmodule 

